render_pages <- function(prepped_object) {
  
  prepped_object %>%
    select(output_file = filename, 
           params = params, 
           output_dir = dir_name) %>%
    pwalk(rmarkdown::render, input = "index.Rmd")
  
  prepped_object %>% 
    select(to = dir_name) %>% 
    pwalk(file.copy, from = 'www', recursive = TRUE, overwrite = TRUE) %>% 
    pwalk(file.copy, from = 'site_libs',  recursive = TRUE, overwrite = TRUE) %>% 
    pwalk(file.copy, from = 'description.html', overwrite = TRUE) 
  
}
