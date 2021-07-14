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

# Enterprise Counties request from Aaron 2020-12-21
prepped03 <- prep_pages(url = "data/03_enterprise-counties.csv",
                        output_directory = "factsheets/03_enterprise-counties")

render_pages(prepped_object = prepped03)

# DC Request from 2020-12-22
prepped04 <- prep_pages(url = "data/04_district-of-columbia.csv",
                        output_directory = "factsheets/04_district-of-columbia")

render_pages(prepped_object = prepped04)

# RFI finalists 2021-01-08
prepped05 <- prep_pages(url = "data/05_rfi-finalists.csv",
                        output_directory = "factsheets/05_rfi-finalists")

render_pages(prepped_object = prepped05)

# NACO 2021-02-16
prepped06 <- prep_pages(url = "data/06_naco.csv",
                        output_directory = "factsheets/06_naco")

render_pages(prepped_object = prepped06)

# CFON 2021-03-04
prepped07 <- prep_pages(url = "data/07_cfon.csv",
                        output_directory = "factsheets/07_cfon")

render_pages(prepped_object = prepped07)

# RFI finalists 2021-01-08 (data viz)

prepped09 <- prep_pages(url = "data/05_rfi-finalists.csv",
                        output_directory = "factsheets/09_rfi-finalists-viz")

render_pages(prepped_object = prepped09, input = "visualizations.Rmd")





