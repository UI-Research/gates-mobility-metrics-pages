library(tidyverse)

source("R/prep_pages.R")
source("R/render_pages.R")

# Greg's Adams County request from 2020-12-03
prepped02 <- prep_pages(url = "data/02_other-communities.csv",
                        output_directory = "boom/")

render_pages(prepped_object = prepped02)

