#' Function to create the "Detail" table for a metric
#' 
#'@param metrics_info_df (list) A list composed of 13 elements with information
#'  about a metric. In practice, the first output from the get_vars_info function
#'  for this argument
#'@param dataset (data.frame) A dataframe. In practice either the data or data_sub
#'  objects
#'@param varname_maps (list of vectors containing strings) A list containing
#'  four vectors. 
#'    The first vector lists the metric name(s). 
#'    The second contains "human-readible" names. 
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

create_tb_level2 <- function(metrics_info_df, 
                             dataset, 
                             varname_maps,
                             tb_title_size = 18,
                             tb_subtitle_size = 16,
                             tb_font_size = 14, 
                             source_note_size = 11,
                             tb_width_perc = 80,
                             tb_align = "left") {
  
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  data_source <- metrics_info_df$source_data
  subgroup_this_var <- metrics_info_df$subgroup_id
  notes <- metrics_info_df$notes
  
  if (str_detect(subgroup_this_var, fixed("|")) == TRUE) {
    
    subgroup_this_var <- strsplit(subgroup_this_var, "|", fixed = TRUE)[[1]][1]
    
  } 
  
  dataset <- dataset %>% 
    filter(subgroup_id == subgroup_this_var) %>% 
    filter(subgroup_type == "all") 
  
  mb_vars_lst <- dataset %>% 
    select(setdiff(matches(mb_vars),
                   matches("_lb|_ub|_quality"))) %>%
    colnames()
      
  if (metrics_info_df$ci_var == 1) {
    
    for (val in mb_vars_lst) {      # update this to purrr 
      
      dataset <- unite_col_values(dataset, val)
      ci_str <- "Confidence Interval"
      
    } 
    
    temp <- dataset %>% 
      select(
        matches(metrics_info_df$metric_vars_prefix[[1]]),
        matches(metrics_info_df$quality_variable[[1]]),
        matches("state_county"), 
        -matches("_lb|ub")
      )
    
    temp <- temp %>% 
      mutate_all(as.character) %>% 
      rename(all_of(varname_maps$detail_vars))
    
  } else if (metrics_info_df$ci_var == 2) {
    
    ci_str <- "Confidence Interval*"   # *CI not available at this time.
    metrics_desp <- md(glue("{metrics_desp}<sup>*</sup>"))
    
    # create an empty df      #take this part out as a sep func 
    col_names <- glue("{mb_vars_lst}_ci")
    vec <- vector(mode = "character", length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    temp <- dataset %>% 
      select(
        matches(metrics_info_df$metric_vars_prefix[[1]]),
        matches(metrics_info_df$quality_variable[[1]]),
        matches("state_county"), 
        -matches("_lb|ub")
      )
    
    notes <- paste0(notes, 
                    "<br><br>",
                    "The Confidence Interval for this metric is not available at this time.")
    
    temp <- temp %>% 
      mutate_all(as.character) %>% 
      rename(all_of(varname_maps$summary_vars))
    
  } else if (metrics_info_df$ci_var == 3) {
    
    ci_str <- "Confidence Interval+"   # "+CI not applicable.
    
    metrics_desp <- md(glue("{metrics_desp}<sup>+</sup>"))
    
    
    # create an empty df 
    col_names <- glue("{mb_vars_lst}_ci")
    vec <- vector(mode = "character", length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    temp <- dataset %>% 
      select(
        matches(metrics_info_df$metric_vars_prefix[[1]]),
        matches(metrics_info_df$quality_variable[[1]]),
        matches("state_county"), 
        -matches("_lb|ub")
      )

    notes <- paste0(notes, 
                "<br><br>",
                "The Confidence Interval for this metric is not applicable.")
    
    temp <- temp %>% 
      mutate_all(as.character) %>% 
      rename(all_of(varname_maps$summary_vars))
    
  }
  

  
  # each variable has its own quality variable 
  if (!str_detect(metrics_info_df$quality_variable[[1]], "|")){  
    
    temp <- temp %>% 
      relocate(!!sym(metrics_info_df$quality_variable[[1]]), .after = last_col())  
    
  } 
  
  # transpose table and generate HTML for table
  temp %>% 
    pivot_longer(!state_county, names_to="metrics", values_to="value") %>%
    pivot_wider(names_from = "state_county", values_from = "value") %>% 
    arrange(match(metrics, names(varname_maps$summary_vars))) %>%  
    mutate(metrics = gsub(".*_ci", ci_str, metrics)) %>% 
    mutate(metrics = gsub(".*_quality", "Quality", metrics)) %>% 
    select(metrics, everything()) %>% 
    gt(
      rowname_col = "metrics",
      id = "tb_level2"
    ) %>% 
    tab_header(
      title = "",
      subtitle = metrics_desp
    ) %>%
    tab_source_note(html(str_c("<b>Source:</b>", data_source, sep=" "))) %>%
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
