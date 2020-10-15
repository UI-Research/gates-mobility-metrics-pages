library(rmarkdown)
library(stringr)
library(tidyverse)
library(glue)

# read in the applicant list 
app_list <- read_csv('data/rfi-applicants.csv')

# format app list 
app_list <- app_list %>% 
  mutate(fips = str_pad(fips, width = 5, side = 'left', pad = '0')) %>% 
  mutate(full_list = case_when(!is.na(comparisons) ~ str_c(fips, comparisons, sep = ';'),
                               TRUE ~ str_c(fips, sep = ';'))) %>% 
  mutate(full_list = gsub('\\s+', '', full_list)) %>% 
  mutate(full_list = strsplit(full_list, ';')) %>% 
  mutate(county = gsub(' County', '', county)) %>% 
  mutate(uni_id = str_c(fips, county, state, sep = "-")) %>% 
  mutate(uni_id = gsub(' ', '-', uni_id)) %>% 
  sample_n(5)


# create an index
app_indexes <- as.list(
  app_list$full_list
)

full_name_lst <- as.list(
  app_list$uni_id
)

# create a data frame with parameters and output file names
runs <- tibble(
  filename = "index.html",             # creates a string with output file names in the form <index>.pdf
  params = map(app_indexes, ~list(state_county = .)), 
  dir_name = map(full_name_lst, function(x) glue('factsheets/{x}'))
)        # creates a nest list of parameters for each object in the index


# iterate render() along the tibble of parameters and file names
runs %>%
  select(output_file = filename, 
         params = params, 
         output_dir = dir_name) %>%
  pwalk(rmarkdown::render, input = "index.Rmd")


runs %>% 
  select(to = dir_name) %>% 
  pwalk(file.copy, from = 'www', recursive = T, overwrite = T) %>% 
  pwalk(file.copy, from = 'site_libs',  recursive = T, overwrite = T) %>% 
  pwalk(file.copy, from = 'description.html', overwrite = T) 

