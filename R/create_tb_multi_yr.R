create_tb_multi_yr <- function(metrics_info_df, dataset, varname_maps){
  
  mb_metrics <- metrics_info_df$metric_name
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  quality_var  <- metrics_info_df$quality_variable[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  subgroup_this_var <- metrics_info_df$subgroup_id
  ci_vars <- metrics_info_df$ci_var
  notes <- metrics_info_df$notes
  notes2 <- metrics_info_df$notes2
  data_source2 <- metrics_info_df$source_data2
  
  subgroup_varname = subgroup_type_name <- 'year'
  
  if (mb_vars == 'average_to_living_wage_ratio'){
    notes <- notes2
  }
  
  col_from <- varname_maps[3][[1]]
  col_to <- varname_maps[4][[1]]
  
  var_rename_lst <- gen_variable_name_map(varname_maps)
  
  dataset <- dataset %>% 
    filter(is_year == 1) 
  
  mb_vars_lst <- colnames(dataset %>% 
                            select(setdiff(matches(mb_vars), matches('_lb|_ub|_quality'))))
  
  var_selection <- function(my_ds){
    my_ds %>% 
      select(matches(glue('{mb_vars}|{quality_var}|{subgroup_varname}|state_county')), -matches('_lb|_ub')) %>% 
      select(-is_year)
  }
  
  
  if (ci_vars == 1){
    
    for (val in mb_vars_lst){      # update this to purrr 
      
      dataset <- unite_col_values(dataset, val)
      ci_str <- 'Confidence Interval'
    } 
    
    temp <- var_selection(dataset) 
    
    # display NA instead of (), if metrics and its CI for this subgroup is not avaiable 
    temp <- temp %>% mutate_at(vars(contains('ci')), ~ifelse((. == '()')|(. == '(NA, NA)'), NA, .))
    
  } else if (ci_vars == 2){
    
    ci_str <- 'Confidence Interval*'   # *CI not available at this time.
    metrics_desp <- md(glue('{metrics_desp}<sup>*</sup>'))
    
    # create an empty df      #take this part out as a sep func 
    col_names <- glue('{mb_vars_lst}_ci')
    vec <- vector(mode = 'character', length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    col_from <- col_from[-grep("*_ci", col_from)]
    col_to <- col_to[-grep("*_ci", col_to)]
    
    temp <- var_selection(dataset) 
    
    notes <- paste0(notes, 
                    '<br><br>',
                    'The Confidence Interval for this metric is not available at this time.')
    
  } else if (ci_vars == 3){
    
    ci_str <- 'Confidence Interval+'   # '+CI not applicable.
    metrics_desp <- md(glue('{metrics_desp}<sup>+</sup>'))
    
    # create an empty df 
    col_names <- glue('{mb_vars_lst}_ci')
    vec <- vector(mode = 'character', length = nrow(dataset) * length(mb_vars_lst))
    empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
    colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
    
    col_from <- col_from[-grep("*_ci", col_from)]
    col_to <- col_to[-grep("*_ci", col_to)]
    
    temp <- var_selection(dataset)
    
    notes <- paste0(notes, 
                    '<br><br>',
                    'The Confidence Interval for this metric is not applicable.')
    
  }
  
  temp <- temp %>% 
    mutate_all(as.character) %>% 
    rename_at(vars(col_from), function(x) col_to) %>% 
    filter_at(vars(-c(subgroup_varname, 'state_county')), any_vars(!str_detect(., pattern = "NA|$NA")))
  
  
  if (str_detect(quality_var, '|') == FALSE){ #each variable has its own quality variable  
    
    temp <- temp %>% 
      relocate(!!sym(quality_var), .after = last_col())  
  } 
  
  temp <- temp %>% 
    pivot_longer(!c('state_county', 'year', all_of(subgroup_type_name)), 
                 names_to='metrics', 
                 values_to='value') %>% 
    arrange(desc(year)) %>%   
    pivot_wider(names_from = 'state_county', 
                values_from = 'value')
  
  
  county_colnames <- colnames(temp)[c(3:length(colnames(temp)))]
  
  temp %>% 
    #arrange(match(metrics, col_to)) %>% 
    rename(Year = year) %>% 
    mutate(Year = as.numeric(gsub(',', '', Year))) %>% 
    mutate(metrics = gsub('.*_ci', ci_str, metrics)) %>% 
    mutate(metrics = gsub('.*_quality', 'Quality', metrics)) %>% 
    mutate(metrics = recode(metrics, !!!var_rename_lst)) %>% 
    select(metrics, everything()) %>% 
    gt(rowname_col = 'metrics') %>% 
    tab_header(
      title = '', 
      subtitle = metrics_desp
    ) %>% 
    tab_source_note(html(str_c('<b>Source:</b>', data_source2, sep=' '))) %>% 
    tab_source_note(html(str_c('<b>Notes:</b>', notes, sep=' '))) %>% 
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
        columns = county_colnames, 
        rows = metrics == 'Quality')
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "#ececec")
      ),
      locations = cells_body(
        columns = county_colnames, 
        rows = metrics == 'Quality')
    )
} 
