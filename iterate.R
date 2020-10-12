library(rmarkdown)
library(stringr)
library(tidyverse)

# read in the applicant list 
app_list <- read_csv('data/rfi-applicants.csv')

# format app list 
app_list <- app_list %>% 
  mutate(fips = str_pad(fips, width = 5, side = 'left', pad = '0')) %>% 
  mutate(full_list = str_c(fips, comparisons, sep = ';')) %>% 
  mutate(full_list = gsub('\\s+', '', full_list)) %>% 
  mutate(full_list = strsplit(full_list, ';'))

# create an index
index <- as.list(
  app_list$full_list
)

# create a data frame with parameters and output file names
runs <- tibble(
  filename = str_c(map(index,1), ".html"),             # creates a string with output file names in the form <index>.pdf
  params = map(index, ~list(state_county = .)))  # creates a nest list of parameters for each object in the index


# iterate render() along the tibble of parameters and file names
runs %>%
  select(output_file = filename, params) %>%
  pwalk(rmarkdown::render, input = "index.Rmd", output_dir = "factsheets")
