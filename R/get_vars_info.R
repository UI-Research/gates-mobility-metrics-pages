get_vars_info <- function(varname, data_summary_file=m_info){
  
  info_lst <- data_summary_file %>% 
    filter(metric_name == varname) %>%
    purrr::transpose() %>% 
    simplify() %>%
    first()
  
  mb_vars <- info_lst[4][[1]]
  
  return(list(info_lst=info_lst, mb_vars=mb_vars))
}