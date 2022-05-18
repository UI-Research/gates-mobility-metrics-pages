library(tidyverse)

metrics <- read_csv("mobility-metrics/00_mobility-metrics_longitudinal.csv") 

metrics %>%
  filter(state == "39", county == "035") %>%
  filter(year %in% c(2014, 2018)) %>%
  select(year, county_name, state_name, average_to_living_wage_ratio, wage_ratio_quality)

metrics_sub_area <- read_csv("mobility-metrics/04_mobility-metrics_race-share.csv")


metrics_sub_area %>%
  filter(state == "39", county == "035") %>%
  select(state_name, county_name, subgroup, starts_with("share_debt_"))


