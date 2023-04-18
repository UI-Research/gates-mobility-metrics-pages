load_place_data <- function() {
  
  data_recent <- read_csv(
    here("mobility-metrics", "05_mobility-metrics_place_recent.csv"), 
    col_types = cols(
      state = col_character(),
      place = col_character(),
      state_name = col_character(),
      place_name = col_character(),
      meps20_black = col_double(),
      meps20_black_quality = col_double(),
      meps20_hispanic = col_double(),
      meps20_hispanic_quality = col_double(),
      meps20_white = col_double(),
      meps20_white_quality = col_double(),
      meps20_total = col_double(),
      meps20_total_quality = col_double(),
      ratio_black_nh_house_value_households = col_character(),
      ratio_hispanic_house_value_households = col_character(),
      ratio_other_nh_house_value_households = col_character(),
      ratio_white_nh_house_value_households = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data(geography = "place")
  
  data_years <- read_csv(
    here("mobility-metrics","05_mobility-metrics_place_longitudinal.csv"),
    col_types = cols(
      state = col_character(),
      place = col_character(), 
      state_name = col_character(),
      place_name = col_character(),
      meps20_black = col_double(),
      meps20_black_quality = col_double(),
      meps20_hispanic = col_double(),
      meps20_hispanic_quality = col_double(),
      meps20_white = col_double(),
      meps20_white_quality = col_double(),
      meps20_total = col_double(),
      meps20_total_quality = col_double(),
      ratio_black_nh_house_value_households = col_character(),
      ratio_hispanic_house_value_households = col_character(),
      ratio_other_nh_house_value_households = col_character(),
      ratio_white_nh_house_value_households = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data(geography = "place")
  
  data_race_ethnicity <- read_csv(
    here("mobility-metrics", "06_mobility-metrics_place_race-ethnicity_longitudinal.csv"), 
    col_types = cols(
      state = col_character(),
      place = col_character(),
      state_name = col_character(),
      place_name = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data(geography = "place")
  
  data_race_share <- read_csv(
    here("mobility-metrics", "08_place_mobility-metrics_race-share_longitudinal.csv"), 
    col_types = cols(
      state = col_character(),
      place = col_character(),
      state_name = col_character(),
      place_name = col_character(),
      city = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      .default = col_double()
    )
  ) %>%
    rename(
      share_debt_col = share_debt_coll,
      share_debt_col_quality = share_debt_coll_quality
    ) %>%
    prep_data(geography = "place")
  
  data_env <-
    read_csv(
      here("mobility-metrics", "09_place_environmental-exposure_poverty_longitudinal.csv"),
      col_types = cols(
        state = col_character(),
        place = col_character(),
        state_name = col_character(),
        place_name = col_character(),
        subgroup_type = col_character(),
        subgroup = col_character(),
        .default = col_double()
      )
    ) %>%
    prep_data(geography = "place")
  
  data_education_income <-
    read_csv(
      here("mobility-metrics", "09_place_SEDA-income_longitudinal.csv"),
      col_types = cols(
        state = col_character(),
        place = col_character(),
        state_name = col_character(),
        place_name = col_character(),
        subgroup_type = col_character(),
        subgroup = col_character(),
        .default = col_double()
      )
    ) %>%
    prep_data(geography = "place")
  
  data_digital <- read_csv(here("mobility-metrics", "07_digital-access_city_subgroup.csv")) %>%
    prep_data(geography = "place") 
  
  data_pov_exp <- read_csv(here("mobility-metrics", "07_poverty-exposure_city_subgroup.csv")) %>%
    prep_data(geography = "place")
  
  data_list <- list(
    recent = data_recent,
    years = data_years,
    race_ethnicity = data_race_ethnicity,
    race_share = data_race_share,
    env = data_env,
    education_income = data_education_income,
    digital = data_digital,
    pov_exp = data_pov_exp
  )
  
  return(data_list)

}