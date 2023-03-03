#' Helper function called in render_pages() 
#' This function was created when updating from Rmarkdown to quarto
#' Rmd's render() function took an output_dir argument that allowed a knitted html
#'    file to be moved to a subdirectory
#' quarto_render() does not appear to have the same functionality (as of Feb 2023),
#'    so this function renders the quarto documents and then moves then to the
#'    appropriate sub-directory
#' 
#' @param dirname (string) location of where knitted hmtl files should be saved
#' @param input (string) default is "index.qmd". The quarto document to be created.
#' @param output_file (string) name of output file, almost certainly "index.html"
#' @param execute_params (list) list of parameters to be passed into quarto render. 
#' 
#' The function is not intended to return anything, but it writes htmls to the
#'  output_file path 

quarto_render_wrapper <- function(input, output_file, execute_params, dir_name){
  
  quarto_render(input = input,
                output_file = output_file, 
                execute_params = execute_params)
  if(!(dir.exists(dir_name))){
    dir.create(paste0(dir_name, "/"))
  }
  
  file.copy("index.html", to = paste0(dir_name, "/"), overwrite = TRUE)

}


