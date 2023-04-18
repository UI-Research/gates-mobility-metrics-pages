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
  # 
  # #Fast solution - only copy updated files
  # # create directory
  # if(!dir.exists(dir_name)){
  # 
  #   dir.create(dir_name)
  # 
  # }
  # 
  # # copy index.qmd
  # template_name <- paste0(dir_name, "index.qmd")
  # if (!file.exists(template_name)) {
  # 
  #   file.copy(
  #     from = input,
  #     to = template_name
  #   )
  # 
  # }
  # 
  # # copy project yaml
  # yaml_name <- paste0(dir_name, "_quarto.yml")
  # if (!file.exists(yaml_name)) {
  # 
  #   file.copy(
  #     from = "_quarto.yml",
  #     to = yaml_name
  #   )
  # 
  # }
  # 
  # # copy description .qmd
  # description_qmd_name <- paste0(dir_name, "description.qmd")
  # if (!file.exists(description_qmd_name)) {
  # 
  #   file.copy(
  #     from = "description.qmd",
  #     to = description_qmd_name
  #   )
  # 
  # }
  # 
  # # copy description html
  # description_html_name <- paste0(dir_name, "description.html")
  # if (!file.exists(description_html_name)) {
  # 
  #   file.copy(
  #     from = "description.html",
  #     to = description_html_name
  #   )
  # 
  # }
  # 
  # www_name <- paste0(dir_name, "www")
  # if (!(file.exists(www_name))){
  # 
  #   dir.create(www_name)
  # 
  #   file.copy(
  #     from = "www",
  #     to = www_name,
  #     recursive = TRUE
  #   )
  # 
  # }
  # 
  # # mobility_icons <- paste0(dir_name, "www/images/mobility-icons")
  # # if(!(file.exists(mobility_icons))){
  # #   dir.create(mobility_icons)
  # #   
  # #   file.copy(
  # #     from = "www/images/mobility-icons",
  # #     to = mobility_icons,
  # #     recursive = TRUE
  # #   )
  # #   
  # # }
  # 
  # 
  # quarto_render(
  #   input = template_name,
  #   output_file = output_file, 
  #   execute_params = execute_params
  # )
  # 
  # file.remove(template_name)
  # file.remove(description_qmd_name)
  # file.remove(yaml_name)
  # 

  # create directory
  if(!dir.exists(dir_name)){
    
    dir.create(dir_name)
    
  }
  
  # copy index.qmd
  template_name <- paste0(dir_name, "index.qmd")
  if (!file.exists(template_name)) {
    
    file.copy(
      from = input, 
      to = template_name
    )
    
  }
  
  # copy project yaml
  yaml_name <- paste0(dir_name, "_quarto.yml")
  if (!file.exists(yaml_name)) {
    
    file.copy(
      from = "_quarto.yml", 
      to = yaml_name
    )
    
  }
  
  # copy description .qmd
  description_qmd_name <- paste0(dir_name, "description.qmd")
  if (!file.exists(description_qmd_name)) {
    
    file.copy(
      from = "description.qmd", 
      to = description_qmd_name
    )
    
  }
  
  # copy description html
  description_html_name <- paste0(dir_name, "description.html")
  if (!file.exists(description_html_name)) {
    
    file.copy(
      from = "description.html",
      to = description_html_name
    )
    
  }
  
  www_name <- paste0(dir_name, "www")
  if (!file.exists(www_name)) {
    
    dir.create(www_name)
    
    file.copy(
      from = "www", 
      to = dir_name,
      recursive = TRUE
    )
    
  }
  
  
  quarto_render(
    input = template_name,
    output_file = output_file,
    execute_params = execute_params
  )
  
  file.remove(template_name)
  file.remove(description_qmd_name)
  file.remove(yaml_name)
  
}


