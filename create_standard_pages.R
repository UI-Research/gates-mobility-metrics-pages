#Code to create factsheets for all cities and counties
#This does not handle any comparisons. For bespoke comparisons for individual
# counties, please see the create_bespoke_pages.R script

#Gabe Morrison

#2023-03-15

library(tidyverse)
library(quarto)
library(tidycensus)

source("R/create_standard_county_df.R")
source("R/quarto_render_wrapper.R")
source("R/render_pages.R")

#For testing:
small <- prepped_counties %>%
  slice_head(n = 12)

tictoc::tic()
render_pages(prepped_object = small, workers = 4)
tictoc::toc()

#For actual run:
#render_pages(prepped_object = prepped_counties)