create_tb_level2 <- function(metrics_info_df, dataset, varname_maps){
  
  mb_metrics <- metrics_info_df$metric_name
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  quality_var  <- metrics_info_df$quality_variable[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  data_source <- metrics_info_df$source_data
  subgroup_this_var <- metrics_info_df$subgroup_id
  ci_vars <- metrics_info_df$ci_var
  notes <- metrics_info_df$notes
  
  col_from <- varname_maps[3][[1]]
  col_to <- varname_maps[4][[1]]
  
  
  if (str_detect(subgroup_this_var, fixed('|')) == TRUE) {
    
    subgroup_this_var <- strsplit(subgroup_this_var, "|", fixed=TRUE)[[1]][1]
    
  } 
  
  dataset <- dataset %>% 
    filter(subgroup_id == subgroup_this_var) %>% 
    filter(subgroup_type == 'all') 
  
  mb_vars_lst <- colnames(dataset %>% 
                            select(setdiff(matches(mb_vars),
                                           matches('_lb|_ub|_quality'))))
  
  if (ci_vars == 1){
    
    for (val in mb_vars_lst){      # update this to purrr 
      
      dataset <- unite_col_values(dataset, val)
      ci_str <- 'Confidence Interval'
      
    } 
    
    temp <- dataset %>% 
      select(matches(glue('{mb_vars}|{quality_var}|state_county')), -matches('_lb|ub'))
    
  } else if (ci_vars == 2){
    
    ci_str <- 'Confidence Interval*'   # *CI not available at this time.
    metrics_desp <- md(glue('{metrics_desp}<sup>*</sup>'))
    
    # create an empty df      #take this part out as a sep func 
    col_names <- glue('{mb_vars_lst}_ci')
    vec <- vector(mode = 'character', length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    temp <- dataset %>% 
      select(matches(glue('{mb_vars}|{quality_var}|state_county')), -matches('_lb|ub'))
    
    col_from <- col_from[-grep("*_ci", col_from)]
    col_to <- col_to[-grep("*_ci", col_to)]
    
    notes <- paste(notes, 
                   'The Confidence Interval for this metric is not available at this time.',
                   sep = '\n\n')
    
  } else if (ci_vars == 3){
    
    ci_str <- 'Confidence Interval+'   # '+CI not applicable.
    
    metrics_desp <- md(glue('{metrics_desp}<sup>+</sup>'))
    
    
    # create an empty df 
    col_names <- glue('{mb_vars_lst}_ci')
    vec <- vector(mode = 'character', length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    temp <- dataset %>% 
      select(matches(glue('{mb_vars}|{quality_var}|state_county')), -matches('_lb|ub'))
    
    col_from <- col_from[-grep("*_ci", col_from)]
    col_to <- col_to[-grep("*_ci", col_to)]
    
    notes <- paste(notes, 
                   'The Confidence Interval for this metric is not applicable.',
                   sep = '\n\n')
    
  }
  
  temp <- temp %>% 
    mutate_all(as.character) %>% 
    rename_at(vars(col_from), function(x) col_to)
  
  
  if (str_detect(quality_var, '|') == FALSE){ #each variable has its own quality variable  
    
    temp <- temp %>% 
      relocate(!!sym(quality_var), .after = last_col())  
    
  } 
  
  temp %>% 
    pivot_longer(!state_county, names_to='metrics', values_to='value') %>%
    pivot_wider(names_from = 'state_county', values_from = 'value') %>% 
    arrange(match(metrics, col_to)) %>% 
    mutate(metrics = gsub('.*_ci', ci_str, metrics)) %>% 
    mutate(metrics = gsub('.*_quality', 'Quality', metrics)) %>% 
    select(metrics, everything()) %>% 
    gt(rowname_col = 'metrics') %>% 
    tab_header(
      title = '', 
      subtitle = metrics_desp
    ) %>% 
    tab_source_note(str_c('Source:', data_source, sep=' ')) %>% 
    tab_source_note(str_c('Notes:', notes, sep=' ')) %>% 
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
