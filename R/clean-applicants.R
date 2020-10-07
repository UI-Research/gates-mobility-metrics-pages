library(tidyverse)
library(readxl)

apps <- read_excel(here::here("data", "rfi-applicants.xlsx"))

apps <- apps %>%
  select(state = `State Name`,
         county = `County Name`,
         fips = FIPS,
         comparisons = comparison_fips)

write_csv(apps, path = here::here("data", "rfi-applicants.csv"))