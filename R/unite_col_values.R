unite_col_values <- function(df, colname_str){
  
  df <- df %>% 
    unite(!!sym(glue('{colname_str}_ci')), 
          glue('{colname_str}_lb'), 
          glue('{colname_str}_ub'), 
          sep = ', ', 
          remove=TRUE,
          na.rm = TRUE) %>% 
    mutate_at(vars(matches(glue('{colname_str}_ci'))), function(x) as.character(glue('({x})'))) %>%
    mutate_at(vars(matches(glue('{colname_str}_ci'))), function(x) if_else(x %in% c('(0.0%, 0.0%)', '(100.0%, 100.0%)'), 'NC', x))
  
  return(df)
}