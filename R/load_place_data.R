load_place_data <- function() {
  
  place_names <- read_csv(here("mobility-metrics", "place-populations.csv")) %>%
    filter(year == 2020) %>%
    select(state, place, state_name, place_name)
  
  my_col_type <- cols(
    state = col_character(), 
    place = col_character()
  )

  data_recent <- read_csv(
    here("mobility-metrics", "05_mobility-metrics_place_recent.csv"), 
    col_types = cols(
      meps20_black = col_double(),
      meps20_black_quality = col_double(),
      meps20_hispanic = col_double(),
      meps20_hispanic_quality = col_double(),
      meps20_white = col_double(),
      meps20_white_quality = col_double(),
      meps20_total = col_double(),
      meps20_total_quality = col_double()
    )
  ) %>%
    prep_data(geography = "place")
  
  data_years <- read_csv(
    here("mobility-metrics","05_mobility-metrics_place_longitudinal.csv"),
    col_types = cols(
      meps20_black = col_double(),
      meps20_black_quality = col_double(),
      meps20_hispanic = col_double(),
      meps20_hispanic_quality = col_double(),
      meps20_white = col_double(),
      meps20_white_quality = col_double(),
      meps20_total = col_double(),
      meps20_total_quality = col_double()
    )
  ) %>%
    prep_data(geography = "place")
  
  data_race_ethnicity <- read_csv(
    here("mobility-metrics", "06_mobility-metrics_place_race-ethnicity_longitudinal.csv"), 
    col_types = my_col_type
  ) %>%
    left_join(place_names, by = c("state", "place")) %>%
    prep_data(geography = "place")
  
  data_race_share <- read_csv(
    here("mobility-metrics", "08_place_mobility-metrics_race-share_longitudinal.csv"), 
    col_types = my_col_type
  ) %>%
    prep_data(geography = "place")
  
  data_list <- list(
    recent = data_recent,
    years = data_years,
    race_ethnicity = data_race_ethnicity,
    race_share = data_race_share
  )
  
  return(data_list)

}