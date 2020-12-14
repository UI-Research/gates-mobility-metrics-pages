library(tidyverse)

source("R/prep_pages.R")
source("R/render_pages.R")

# Mobility Metrics applicants
prepped01 <- prep_pages(url = "data/01_rfi-applicants.csv",
                        output_directory = "factsheets/01_rfi-applicants/")

render_pages(prepped_object = prepped01)

# Greg's Adams County request from 2020-12-03
prepped02 <- prep_pages(url = "data/02_adams-county.csv",
                        output_directory = "factsheets/02_adams-county")

render_pages(prepped_object = prepped02)

