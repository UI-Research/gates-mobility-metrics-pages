#' Create "More Data" for a given metric
#' 
#'@param metrics_info (list) A list composed of 13 elements with information
#'  about a metric. In practice, the first output from the get_vars_info function
#'  for this argument
#'@param data (data.frame) A dataframe. In practice either the data or data_sub
#'  objects
#'@param varname_maps (list of vectors containing strings) A list containing
#'  four vectors. 
#'    The first vector lists the metric name(s). 
#'    The second contains "human-readable" names. 
#'    The third lists the metric names and their relevant confidence interval columns. 
#'    The four lists the metric name(s) followed by the metric name(s) concatenated with "_ci"
#'@param tb_title_size (integer) Table title size. Default set to 18
#'@param tb_subtitle_size (integer) Table sub-title size. Default set to 14.
#'@param tb_font_size (integer) Table font size. Default set to 12.
#'@param source_note_size (integer) Size of source note. Default set to 11.
#'@param tb_width_perc (float) Table width percentage. Should be between 0 and 100.
#'  Default to 80.
#'@param tb_align (string) Table alignment. Default set to "left".
#'@return (gt table object) Returns an unnamed gt table object. 
#'
create_tb_more_data <- function(
    data,
    metrics_info, 
    varname_maps,
    tb_title_size = 18,
    tb_subtitle_size = 16,
    tb_font_size = 14, 
    source_note_size = 11,
    tb_width_perc = 80,
    tb_align = "left",
    years
) {

  mb_vars  <- metrics_info$metric_vars_prefix
  metrics_desp  <- metrics_info$metrics_description  
  notes <- metrics_info$notes3

  # filter data to years of interest
  data <- data %>%
    filter(year %in% metrics_info$years)
  
  # prep table notes
  # different confidence intervals
  if (metrics_info$ci_var == 1) {
    
    # get variable names for confidence intervals
    mb_vars_lst <- data %>% 
      select(matches(mb_vars)) %>%
      select(matches("_lb|_ub|_quality")) %>%
      colnames() %>%
      str_remove_all("_lb|_ub|_quality") %>%
      unique()
    
    for (val in mb_vars_lst) {      # update this to purrr 
      
      # combine two CI variables into one variable
      data <- unite_col_values(data, val)
      ci_str <- "Confidence Interval"
      
    } 
    
    temp <- data %>% 
      select(
        matches(metrics_info$metric_vars_prefix),
        matches(metrics_info$quality_variable),
        matches("state_county"), 
        -matches("_lb|ub")
      )
    
    temp <- temp %>% 
      mutate_all(as.character) %>% 
      rename(all_of(varname_maps$detail_vars))
    
  } else if (metrics_info$ci_var == 2) {
    
    ci_str <- "Confidence Interval*"   # *CI not available at this time.
    metrics_desp <- md(glue("{metrics_desp}<sup>*</sup>"))
    
    notes <- paste0(notes, 
                    "<br><br>",
                    "The Confidence Interval for this metric is not available at this time.")
    
  } else if (metrics_info$ci_var == 3) {
    
    ci_str <- "Confidence Interval+"   # "+CI not applicable.
    metrics_desp <- md(glue("{metrics_desp}<sup>+</sup>"))
    
    notes <- paste0(notes, 
                    "<br><br>",
                    "The Confidence Interval for this metric is not applicable.")
    
  }
  
  
  
  
  
  # prep notes
  temp <- data %>% 
    select(
      matches("year"),
      matches("state_county"),
      matches("subgroup"),
      matches(metrics_info$metric_vars_prefix),
      matches(metrics_info$quality_variable),
      -matches("subgroup_type")
    ) %>% 
    select(-matches("_lb|_ub")) %>% 
    select(sort(tidyselect::peek_vars())) %>% 
    rename(any_of(varname_maps$detail_vars)) %>%
    mutate(across(everything(), as.character))
  
  # transpose table and generate HTML for table
  temp <- temp %>% 
    pivot_longer(
      cols = -c(state_county, matches("year"), matches("subgroup")),
      names_to = "metrics", 
      values_to = "value"
    ) %>%   
    pivot_wider(
      names_from = "state_county", 
      values_from = "value"
    ) %>% 
    mutate(metrics = factor(metrics, levels = c(names(varname_maps$detail_vars), "Quality"))) #%>%
    #mutate(metrics = gsub(".*_quality", "Quality", metrics))
    
  arrange_vars <- c("year", names(temp)[names(temp) %in% c("subgroup")], "metrics")
  
  temp <- temp %>%
    arrange(across(any_of(arrange_vars))) %>% 
    select(metrics, everything()) 
  
  levels(temp$metrics) <- gsub(".*_quality", "Quality", levels(temp$metrics))
  levels(temp$metrics) <- gsub(".*_ci", ci_str, levels(temp$metrics)) 

  name_table <- c(
    "Year" = "year",
    "Group" = "subgroup"
  )
  
  temp <- temp %>%
    rename(any_of(name_table))
  
  temp %>% 
    gt(
      rowname_col = "metrics",
      id = "tb_level3"
    ) %>% 
    tab_header(
      title = "", 
      subtitle = metrics_desp
    ) %>% 
    tab_source_note(html(str_c("<b>Source:</b>", metrics_info$source_data2, sep=" "))) %>% 
    tab_source_note(html(str_c("<b>Notes:</b>", notes, sep=" "))) %>% 
    cols_align(
      align = "left",
      columns = everything()
    ) %>% 
    opt_align_table_header("left") %>% 
    tab_options(
      heading.title.font.size = tb_title_size, 
      heading.subtitle.font.size = tb_subtitle_size, 
      column_labels.font.size = tb_font_size,
      table.font.size = tb_font_size,
      source_notes.font.size = source_note_size, 
      table.width = pct(tb_width_perc), 
      table.align = tb_align) %>% 
    tab_style(
      style = list(
        cell_text(style = "italic"),
        cell_fill(color = "#ececec")
      ),
      locations = cells_body(
        columns = everything(), 
        rows = metrics == "Quality")
    ) %>%
    as_raw_html()
  
  
}
