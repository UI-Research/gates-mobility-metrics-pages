#' Create "Summary Table" for a given metric
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
create_tb <- function(data,
                      metrics_info, 
                      varname_maps,
                      tb_title_size = 18,
                      tb_subtitle_size = 16,
                      tb_font_size = 14, 
                      source_note_size = 11,
                      tb_width_perc = 80,
                      tb_align = "left"
                      ) {

  temp <- data %>% 
    select(
      matches(metrics_info$metric_vars_prefix),
      any_of(metrics_info$quality_variable),
      matches("state_county")
    ) %>% 
    select(-matches("_lb|_ub")) %>% 
    select(sort(tidyselect::peek_vars())) %>% 
    rename(all_of(varname_maps$summary_vars)) 
  
  # each variable has its own quality variable
  if (!str_detect(metrics_info$quality_variable[[1]], "|")) {   
    
    temp <- temp %>% 
      relocate(!!sym(metrics_info$quality_variable[[1]]), .after = last_col())  
    
  } 
  
  # transpose table and generate HTML for table
  temp %>% 
    mutate(across(everything(), as.character)) %>%
    pivot_longer(!state_county, names_to="metrics", values_to="value") %>%   
    pivot_wider(names_from = "state_county", values_from = "value") %>% 
    arrange(match(metrics, names(varname_maps$detail_vars))) %>% 
    mutate(metrics = gsub(".*_quality", "Data quality", metrics)) %>% 
    select(metrics, everything()) %>% 
    gt(
      rowname_col = "metrics",
      id = "tb"
    ) %>% 
    tab_header(
      title = "", 
      subtitle = metrics_info$metrics_description
    ) %>% 
    tab_source_note(md(str_c("<b>Source:</b>", metrics_info$source_data, sep=" "))) %>% 
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
        rows = metrics == "Data quality")
    ) %>%
    as_raw_html()
  
}
