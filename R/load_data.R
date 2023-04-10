load_data <- function() {
  
  my_col_type <- cols(
    state = col_character(), 
    county = col_character()
  )
  
  county_names <- read_csv(here("mobility-metrics", "old", "01_mobility-metrics.csv")) %>%
    select(state, county, state_name, county_name) %>%
    distinct()
  
  data_recent <- read_csv(
    here("mobility-metrics", "00_mobility-metrics_recent.csv"), 
    col_type = 
      cols(
        state = col_character(),
        county = col_character(),
        ratio_black_nh_house_value_households = col_character(),
        ratio_hispanic_house_value_households = col_character(),
        ratio_other_nh_house_value_households = col_character(),
        ratio_white_nh_house_value_households = col_character(),
        ratio_population_pc_physician = col_character(),
        .default = col_double()
      )
  ) %>%
    left_join(county_names, by = c("state", "county")) %>%
    mutate( 
      share_debt_col_ub = 0,
      share_debt_col_lb = 1,
      
      digital_access = 0.1234,
      digital_access_quality = 3
      
    ) %>%
    prep_data()
  
  data_years <- read_csv(
    here("mobility-metrics","00_mobility-metrics_longitudinal.csv"),
    col_type = cols(
      state = col_character(),
      county = col_character(),
      ratio_black_nh_house_value_households = col_character(),
      ratio_hispanic_house_value_households = col_character(),
      ratio_other_nh_house_value_households = col_character(),
      ratio_white_nh_house_value_households = col_character(),
      ratio_population_pc_physician = col_character(),
      .default = col_double()
    )
  ) %>%
    mutate(
      election_turnout = 0.1234,
      election_turnout_quality = 3,
      
      digital_access = 0.1234,
      digital_access_quality = 3
      
    ) %>%
    left_join(county_names, by = c("state", "county")) %>%
    prep_data()
  
  data_race_ethnicity <- read_csv(
    here("mobility-metrics", "01_mobility-metrics_race-ethnicity_recent.csv"), 
    col_types = my_col_type
  ) %>%
    left_join(county_names, by = c("state", "county")) %>%
    prep_data()
  
  data_race <- read_csv(
    here("mobility-metrics", "02_mobility-metrics_race_recent.csv"), 
    col_types = my_col_type
  ) %>%
    left_join(county_names, by = c("state", "county")) %>%
    prep_data()
  
  data_race_share <- read_csv(
    here("mobility-metrics", "03_mobility-metrics_race-share_recent.csv"), 
    col_types = my_col_type
  ) %>%
    left_join(county_names, by = c("state", "county")) %>%
    prep_data()
  
  data_list <- list(
    recent = data_recent,
    years = data_years,
    race_ethnicity = data_race_ethnicity,
    race = data_race,
    race_share = data_race_share
  )
  
  return(data_list)

}