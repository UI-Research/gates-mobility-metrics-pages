#Code to create factsheets for all cities and counties
#This does not handle any comparisons. For bespoke comparisons for individual
# counties, please see the create_bespoke_pages.R script

#Gabe Morrison and Aaron R. Williams

library(tidyverse)
library(quarto)
library(tidycensus)
library(furrr)

source("R/create_standard_county_df.R")
source("R/create_standard_place_df.R")
source("R/quarto_render_wrapper.R")
source("R/render_pages.R")


#Set number of cores for instance:
NCORES <- 124 
# 
# #For testing:
# small_county <- prepped_counties %>%
#   slice_head(n = 4)
# 
# tictoc::tic()
# render_pages(prepped_object = small_county, workers = 4, input = "index-county.qmd")
# tictoc::toc()
# 
# small_place <- prepped_places %>%
#   slice_head(n = 4)
# 
# tictoc::tic()
# render_pages(prepped_object = small_place, workers = 4, input = "index-place.qmd")
# tictoc::toc()

# #For actual run:
tictoc::tic()
render_pages(prepped_object = prepped_counties, workers = NCORES, input = "index-county.qmd")
tictoc::toc()

tictoc::tic()
render_pages(prepped_object = prepped_places, workers = NCORES, input = "index-place.qmd")
tictoc::toc()
