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

quarto_render_wrapper <- function(input, output_file, execute_params, dir_name) {
  
  # we must render the pages in the top-level directory because of changes to 
  # quarto
  # we render all files in the top-level directory and then copy the needed 
  # files to the destination directory
  # delete directory and contents if it exists
  
  if (dir.exists(dir_name)) {
    
    unlink(dir_name, recursive = TRUE)
    
  }
  
  # create destination directory for data tables
  if (!dir.exists(dir_name)){
    
    dir.create(dir_name)
    
  }
  
  # copy supporting files to destination directory
  www_name <- paste0(dir_name, "www")
  dir.create(www_name)
  file.copy(
    from = "www", 
    to = dir_name,
    recursive = TRUE
  )
  
  # copy description html to destination directory
  description_html_name <- paste0(dir_name, "description.html")
  file.copy(
    from = "description.html",
    to = description_html_name,
    overwrite = TRUE
  )
  
  # copy input to generic index.qmd
  # this is needed so _quarto.yml will work with the county and city templates
  file.copy(
    from = input, 
    to = paste0(dir_name, "index.qmd")
  )
  
  # this file ensures that the rendered document is a full website instead of 
  # individual pages
  file.copy(
    from = "_quarto.yml", 
    to = paste0(dir_name, "_quarto.yml")
  )

  xfun::in_dir(
    dir = dir_name,
    expr = quarto_render(
      input = "index.qmd",
      output_file = basename(output_file),
      execute_params = execute_params
    )
  )
  
  file.remove(paste0(dir_name, "index.qmd"))
  
  
}


