source("R/quarto_render_wrapper.R")

#' Function to render a series or Rmd files based on specifications provided
#' 
#' This function does two things. Most importantly, it calls rmarkdown::render
#'  and inputs the prepped_object dataframe (with columns renamed). It also
#'  copies the some files to the dir_name directory
#' 
#' @param prepped_object (tibble) run A dataframe directly outputted from the 
#'  create_pages function. The dataframe has three colums: 
#'    filename - set to be "index.html" 
#'    params - contains a list of the fips code listed in the fips and comparisons 
#'      columns of the datasets pointed to by the url argument
#'    dirname - location of where knitted hmtl files should be saved
#' @param input (string) default is "index.qmd". The Rmd template to be created. 
#' 
#' @returns pwalk implicitly returns the list inputted to it. The return objects
#' are not used for this function, however.
render_pages <- function(prepped_object, input = "index.qmd") {
  
  prepped_object %>%
    select(output_file = filename, 
           execute_params = params, 
           dir_name
           #output_dir = dir_name
           ) %>%
    pwalk(quarto_render_wrapper, input = input)
  
  

  
  prepped_object %>% 
    select(to = dir_name) %>% 
    pwalk(file.copy, from = 'www', recursive = TRUE, overwrite = TRUE) %>% 
    pwalk(file.copy, from = 'site_libs',  recursive = TRUE, overwrite = TRUE) %>% 
    pwalk(file.copy, from = 'description.html', overwrite = TRUE) 
  
}
