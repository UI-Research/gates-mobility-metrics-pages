library(tidyverse)
library(stringr)
library(glue)

#' Function to create a dataframe used to create a factsheet
#' 
#' This function works with the create_pages function to support the render_pages.R
#' script. The point of the render_pages script is to create markdown files based
#' on the index.Rmd markdown file. 
#' 
#' This function sets the "groundwork" for that to happen. It reads in a 
#' dataframe and returns a different dataframe. The second dataframe is read by
#' the render_pages function. 
#' 
#' 
#' @param url (string) the location of a file showing the a county to analyze
#'   and a set of comparison counties against which the county should be compared
#' @param output_directory (string) a filepath showing where the finalized html
#'   files should be written to
#' @param state_title (boolean) Default to FALSE. The function returns a dataframe
#'    with one column being a nested list (see below). One component of the list
#'    is an element named "state_title." This argument is written into that element
#'
#' @returns run (tibble) A dataframe with three columns: 
#'  filename - set to be "index.html" 
#'  params - contains a list of the fips code listed in the fips and comparisons 
#'    columns of the datasets pointed to by the url argument
#'  dirname - location of where knitted hmtl files should be saved
#'  
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
