create_tb <- function(metrics_info_df, dataset, varname_maps){
  
  mb_metrics <- metrics_info_df$metric_name
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  quality_var  <- metrics_info_df$quality_variable[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  data_source <- metrics_info_df$source_data
  subgroup_this_var <- metrics_info_df$subgroup_id
  col_from <- varname_maps[1][[1]]
  col_to <- varname_maps[2][[1]]
  
  if (str_detect(subgroup_this_var, fixed('|')) == TRUE) {
    
    subgroup_this_var <- strsplit(subgroup_this_var, "|", fixed=TRUE)[[1]][1]
    
  } 
  
  
  temp <- dataset %>% 
    filter(subgroup_type == 'all', subgroup_id == subgroup_this_var)
  
  
  temp <- temp %>% 
    select(matches(glue('{mb_vars}|{quality_var}|state_county'))) %>% 
    select(-matches('_lb|_ub')) %>% 
    select(sort(tidyselect::peek_vars())) %>% 
    rename_at(vars(all_of(col_from)), function(x) col_to) 
  
  
  if (str_detect(quality_var, '|') == FALSE){ #each variable has its own quality variable  
    
    temp <- temp %>% 
      relocate(!!sym(quality_var), .after = last_col())  
    
  } 
  
  temp %>% 
    pivot_longer(!state_county, names_to='metrics', values_to='value') %>%   
    pivot_wider(names_from = 'state_county', values_from = 'value') %>% 
    arrange(match(metrics, col_to)) %>% 
    mutate(metrics = gsub('.*_quality', 'Quality', metrics)) %>% 
    select(metrics, everything()) %>% 
    gt(rowname_col = 'metrics') %>% 
    tab_header(
      title = '', 
      subtitle = metrics_desp
    ) %>% 
    tab_source_note(html(str_c('Source:', data_source, sep=' '))) %>% 
    cols_align(
      align = 'left',
      columns = TRUE
    ) %>% 
    cols_align(
      align = 'left',
      columns = TRUE
    ) %>% 
    opt_align_table_header('left') %>% 
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
        cell_text(style = "italic")
      ),
      locations = cells_body(
        columns = TRUE, 
        rows = metrics == 'Quality')
    )
}
