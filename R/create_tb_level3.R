#' Title
#'
#' @param metrics_info_df 
#' @param dataset 
#' @param varname_maps 
#'
#' @return
#' @export
#'
#' @examples
create_tb_level3 <- function(metrics_info_df, dataset, varname_maps){
  
  mb_metrics <- metrics_info_df$metric_name
  mb_vars  <- metrics_info_df$metric_vars_prefix[[1]]
  quality_var  <- metrics_info_df$quality_variable[[1]]
  metrics_desp  <- metrics_info_df$metrics_description
  data_source2 <- metrics_info_df$source_data2
  subgroup_this_var <- metrics_info_df$subgroup_id
  ci_vars <- metrics_info_df$ci_var
  notes2 <- metrics_info_df$notes2
  
  subgroup_varname <- 'subgroup'
  
  col_from <- varname_maps[3][[1]]
  col_to <- varname_maps[4][[1]]
  
  var_rename_lst <- gen_variable_name_map(varname_maps)
  
  create_tb_by_subgroup <- function(subgroup_category){
    
    dataset <- dataset %>% filter(subgroup_id == subgroup_category)
    
    mb_vars_lst <- colnames(dataset %>% select(setdiff(matches(mb_vars), matches('_lb|_ub|_quality'))))
    
    subgroup_type_name <- 'Group'
    
    var_selection <- function(my_ds){
      my_ds %>% 
        select(matches(glue('{mb_vars}|{quality_var}|{subgroup_varname}|state_county')), -matches('_lb|_ub')) %>% 
        select(-subgroup_type) %>% 
        rename(!!subgroup_type_name := subgroup)
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
      
      notes2 <- paste(notes2, 
                      'The Confidence Interval for this metric is not available at this time.',
                      sep = '<br><br>')
      
    } else if (ci_vars == 3){
      
      ci_str <- 'Confidence Interval+'   # '+CI not applicable.
      metrics_desp <- md(glue('{metrics_desp}<sup>+</sup>'))
      
      # create an empty df 
      
      col_names <- glue('{mb_vars_lst}_ci')
      vec <- vector(mode = 'character', length = nrow(dataset) * length(mb_vars_lst))
      empty_ci_df <- as.data.frame(matrix(vec, c(nrow(dataset), length(mb_vars_lst))))
      colnames(empty_ci_df)[1:length(mb_vars_lst)] <- col_names
      
      temp <- var_selection(dataset)
      
      col_from <- col_from[-grep("*_ci", col_from)]
      col_to <- col_to[-grep("*_ci", col_to)]
      
      notes2 <- paste(notes2, 
                      'The Confidence Interval for this metric is not applicable.',
                      sep = '<br><br>')
    }
    
    temp <- temp %>% 
      mutate_all(as.character) %>% 
      rename_at(vars(col_from), function(x) col_to)
    
    
    if (str_detect(quality_var, '|') == FALSE){ #each variable has its own quality variable  
      
      temp <- temp %>% 
        relocate(!!sym(quality_var), .after = last_col())  
    } 
    
    temp <- temp %>% 
      pivot_longer(!c('state_county', 'subgroup_id', all_of(subgroup_type_name)), 
                   names_to='metrics', 
                   values_to='value') %>% 
      pivot_wider(names_from = 'state_county', 
                  values_from = 'value') %>% 
      select(-subgroup_id)
    
    county_colnames <- colnames(temp)[c(3:length(colnames(temp)))]
    
    temp %>% 
      #arrange(match(metrics, col_to)) %>% 
      mutate(metrics = gsub('.*_ci', ci_str, metrics)) %>% 
      mutate(metrics = gsub('.*_quality', 'Quality', metrics)) %>% 
      mutate(metrics = recode(metrics, !!!var_rename_lst)) %>% 
      select(metrics, everything()) %>% 
      gt(rowname_col = 'metrics') %>% 
      tab_header(
        title = '', 
        subtitle = metrics_desp
      ) %>% 
      tab_source_note(html(str_c('Source:', data_source2, sep=' '))) %>% 
      tab_source_note(html(str_c('Notes:', notes2, sep=' '))) %>% 
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
      )
  }
  
  
  # get multiple subgroup types if exists 
  if (str_detect(subgroup_this_var, fixed('|'))){
    
    sg_lst <- strsplit(subgroup_this_var, "|", fixed=TRUE)[[1]]
    
    for (i in sg_lst){
      print(create_tb_by_subgroup(i))
    }
    
  } else{
    
    create_tb_by_subgroup(subgroup_this_var)
  }
  
} 
