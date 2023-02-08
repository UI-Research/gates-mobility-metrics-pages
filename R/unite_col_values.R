#' #Helper function to combine lower bound and upper bound columns into one ci 
#' 
#' Function takes the df, identifies the lb and ub columns, combines them into
#'  one column in the form (lb, ub) as a string and then checks of the values 
#'  are both 0 or 100. In that case, the bounds are replaced with NC. 
#' 
#' @param df (dataframe) a dataframe with columns of format {colname_str}_lb and
#' {colname_str}_ub
#' @param colname_str (string) the prefix of (at least) two columns in in df
#' @return df (dataframe) the dataframe with an updated {colname_str}_ci column
#'  replacing the {colname_str}_lb and {colname_str}_ub columns 
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