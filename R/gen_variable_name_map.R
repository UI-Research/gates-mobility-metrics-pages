#' Function to generate map between snake_case and human_readable variable names
#' 
#' Note: this function called in the create_tb_multi_yr, create_tb_multi_yr_homless,
#'  amd create_tb_multi_yr_homeless
#' 
#'@param varname_maps (list of vectors containing strings) A list containing
#' four vectors. 
#'  The first vector lists the metric name(s). 
#'  The second contains "human-readable" names. 
#'  The third lists the metric names and their relevant confidence interval columns. 
#'  The four lists the metric name(s) followed by the metric name(s) concatenated with "_ci"
#'@return my_list (named list) A named list where names are the snake_case variable
#'  name and list elements are human-readable names 

gen_variable_name_map <- function(varname_maps){
  
  col_from <- varname_maps[3][[1]]
  col_to <- varname_maps[4][[1]]
  
  test <- map2(col_from, col_to, list)
  
  my_list <- list()
  
  for (i in list(1, length(test))){
    my_list[[ test[[i]][[1]] ]] <- test[[i]][[2]]
  }
  
  return(my_list)
}