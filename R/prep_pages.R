library(tidyverse)
library(stringr)
library(glue)

prep_pages <- function(url, output_directory, state_title = FALSE) {
  
  # read in the applicant list 
  app_list <- read_csv(url)
  
  # format app list 
  app_list <- app_list %>% 
    mutate(fips = stringr::str_pad(fips, width = 5, side = 'left', pad = '0')) %>% 
    mutate(full_list = case_when(!is.na(comparisons) ~ stringr::str_c(fips, comparisons, sep = ';'),
                                 TRUE ~ str_c(fips, sep = ';'))) %>% 
    mutate(full_list = gsub('\\s+', '', full_list)) %>% 
    mutate(full_list = strsplit(full_list, ';')) %>% 
    mutate(county = gsub(' County', '', county)) %>% 
    mutate(uni_id = str_c(fips, county, state, sep = "-")) %>% 
    mutate(uni_id = gsub(' ', '-', uni_id)) %>%
    mutate(uni_id = str_replace_all(string = uni_id, pattern = ";", replacement = ""))
  
  
  # create an index
  app_indexes <- as.list(
    app_list$full_list
  )
  
  full_name_lst <- as.list(
    app_list$uni_id
  )
  
  if ("random_id" %in% names(app_list)) {
    
    # create a data frame with parameters and output file names
    runs <- tibble(
      filename = "index.html",             # creates a string with output file names in the form <index>.pdf
      params = map(app_indexes, ~list(state_county = ., state_title = state_title)), 
      dir_name = paste0(output_directory, '/', full_name_lst, "_", app_list$random_id)
    )        # creates a nest list of parameters for each object in the index
    
  } else {
    
    # create a data frame with parameters and output file names
    runs <- tibble(
      filename = "index.html",             # creates a string with output file names in the form <index>.pdf
      params = map(app_indexes, ~list(state_county = ., state_title = state_title)), 
      dir_name = map(full_name_lst, function(x) paste0(output_directory, glue('/{x}')))
    )        # creates a nest list of parameters for each object in the index
    
  }
  
  return(runs)
  
}
