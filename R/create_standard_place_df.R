#Code to create data for standard factsheets for places

#Gabe Morrison

#2023-03-15

library(tidyverse)
library(tidycensus)

if(!file.exists("data/998_all-places.Rda")) {
  
  place_geoids <- read_csv(here("mobility-metrics", "place-populations.csv")) %>%
    filter(year == 2020)
  
  prepped_places <- place_geoids %>%  
    mutate(GEOID = paste0(state, place)) %>%
    select(geoid = GEOID) %>%
    mutate(state_title = list(state_title = FALSE),
           geoid = str_c(geoid, ";"),
           geoid = strsplit(geoid, ";")
    )
  
  geoid_lst <- as.list(prepped_places$geoid)
  
  prepped_places <- tibble(filename = "index.html", 
                             params = map(geoid_lst, 
                                          ~list(state_place = ., 
                                                state_title = FALSE)
                                          ),
                             dir_name = str_c("factsheets/998_place-pages/", geoid_lst, "/")
  )
  
  save(prepped_places, file = "data/998_all-places.Rda")
  
} else {
  
  load("data/998_all-places.Rda")
  
}
