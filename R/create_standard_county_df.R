#Code to create data for standard factsheets for counties

#Gabe Morrison

#2023-03-15

library(tidyverse)
library(tidycensus)

if(!file.exists("data/999_all-counties.Rda")) {
  
  county_geoids <- get_acs(geography = "county", 
                           variable = "B01001A_001", 
                           year = 2021) 
  
  prepped_counties <- county_geoids %>%  
    select(geoid = GEOID) %>%
    mutate(state_title = list(state_title = FALSE),
           geoid = str_c(geoid, ";"),
           geoid = strsplit(geoid, ";")
    ) %>%
    filter(str_sub(geoid, 1, 2) != "72")
  
  geoid_lst <- as.list(prepped_counties$geoid)
  
  prepped_counties <- tibble(filename = "index-county.html", 
                             #filename = "index.html",
                             params = map(geoid_lst, 
                                          ~list(state_county = ., 
                                                state_title = FALSE)
                                          ),
                             dir_name = str_c("factsheets/999_county-pages/", geoid_lst, "/")
  )
  
  save(prepped_counties, file = "data/999_all-counties.Rda")
  
} else {
  
  load("data/999_all-counties.Rda")
  
}
