library(tidyverse)

file <- "mobility-metrics/00_mobility-metrics_longitudinal.csv"
new_file <- "data-requests/latimes/00_mobility-metrics_longitudinal.csv"
fips <- c("06037", "06019", "06071", "06001")

# copy files to this directory
file.copy(
  from = file,
  to = new_file, 
  overwrite = TRUE
)

# filter and select relevant data, then overwrite the data
read_csv(new_file) %>%
  select(
    year, 
    state, 
    county, 
    state_name, 
    county_name,
    share_affordable_30_ami,
    share_affordable_50_ami,
    share_affordable_80_ami,
    housing_quality,
    homeless_count, 
    homeless_share,
    homeless_count_lb,
    homeless_count_ub,
    homeless_quality,
    share_burdened_80_ami,     
    share_burdened_80_ami_ub,
    share_burdened_80_ami_lb,
    share_burdened_50_ami,    
    share_burdened_50_ami_ub,    
    share_burdened_50_ami_lb,     
    share_burdened_30_ami,
    share_burdened_30_ami_ub,    
    share_burdened_30_ami_lb,     
    rent_quality
  ) %>%
  #filter(paste0(state, county) %in% fips) %>%
  filter(year %in% c(2014, 2018)) %>%
  write_csv(new_file)
