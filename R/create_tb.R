#' Create "Summary Table" for a given metric
#' 
#'@param metrics_info_df (list) A list composed of 13 elements with information
#'  about a metric. In practice, the first output from the get_vars_info function
#'  for this argument
#'@param dataset (data.frame) A dataframe. In practice either the data or data_sub
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
 
create_tb <- function(metrics_info_df, 
                      dataset, 
                      varname_maps,
                      tb_title_size = 18,
                      tb_subtitle_size = 14,
                      tb_font_size = 12, 
                      source_note_size = 11,
                      tb_width_perc = 80,
                      tb_align = "left"
                      ){
  
  mb_metrics <- metrics_info_df$metric_name
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  quality_var  <- metrics_info_df$quality_variable[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  data_source <- metrics_info_df$source_data
  subgroup_this_var <- metrics_info_df$subgroup_id
  col_from <- varname_maps[1][[1]]
  col_to <- varname_maps[2][[1]]
  
  if (str_detect(subgroup_this_var, fixed("|")) == TRUE) {
    
    subgroup_this_var <- strsplit(subgroup_this_var, "|", fixed=TRUE)[[1]][1]
    
  } 
  
  
  temp <- dataset %>% 
    filter(subgroup_type == "all", subgroup_id == subgroup_this_var)
  
  
  temp <- temp %>% 
    select(matches(glue("{mb_vars}|{quality_var}|state_county"))) %>% 
    select(-matches("_lb|_ub")) %>% 
    select(sort(tidyselect::peek_vars())) %>% 
    rename_at(vars(all_of(col_from)), function(x) col_to) 
  
  
  if (str_detect(quality_var, "|") == FALSE){ #each variable has its own quality variable  
    
    temp <- temp %>% 
      relocate(!!sym(quality_var), .after = last_col())  
    
  } 
  
  
  temp %>% 
    pivot_longer(!state_county, names_to="metrics", values_to="value") %>%   
    pivot_wider(names_from = "state_county", values_from = "value") %>% 
    arrange(match(metrics, col_to)) %>% 
    mutate(metrics = gsub(".*_quality", "Quality", metrics)) %>% 
    select(metrics, everything()) %>% 
    gt(
      rowname_col = "metrics",
      id = "tb"
    ) %>% 
    tab_header(
      title = "", 
      subtitle = metrics_desp
    ) %>% 
    tab_source_note(html(str_c("<b>Source:</b>", data_source, sep=" "))) %>% 
    cols_align(
      align = "left",
      columns = everything()
    ) %>% 
    # cols_align(
    #   align = "left",
    #   columns = TRUE
    # ) %>% 
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
