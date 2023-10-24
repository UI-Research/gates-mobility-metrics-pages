#'Get information about a mobility metric
#' 
#'This function uses the name of a mobility metric to look up information
#'about it in a the data_summary_file table and returns a list of all information
#'about it and also its name. 
#' 
#'@param varname (string) The name of one of the mobility metrics
#'@param data_summary_file (data.frame) A dataframe with variable information. 
#'  Note that this argument is optional, and the m_info dataframe is used by default.
#'@return A list with two named elements:
#'  info_list (list with 13 named elements) proves information about the metric
#'    including subgroup, data sources, and notes
#'  mb_vars (string) is the name of the variable as listed in the metric_vars_prefix column


get_vars_info <- function(varname, data_summary_file = m_info){
  
  info_lst <- data_summary_file %>% 
    filter(metric_name == varname) %>%
    purrr::transpose() %>% 
    simplify() %>%
    first()
  
  info_lst$metric_vars_prefix <- str_split(info_lst$metric_vars_prefix, ", ")[[1]]
  
  info_lst$quality_variable <- str_split(info_lst$quality_variable, ", ")[[1]]
  
  info_lst$years <- as.numeric(str_split(info_lst$years, ",")[[1]])
  
  mb_vars <- info_lst[4][[1]]
  
  return(list(info_lst=info_lst, mb_vars=mb_vars))
}