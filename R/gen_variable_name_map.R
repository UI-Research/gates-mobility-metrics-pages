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