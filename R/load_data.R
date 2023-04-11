load_data <- function() {
  
  data_recent <- read_csv(
    here("mobility-metrics", "00_mobility-metrics_recent.csv"), 
    col_type = 
      cols(
        state = col_character(),
        county = col_character(),
        state_name = col_character(),
        county_name = col_character(),
        ratio_black_nh_house_value_households = col_character(),
        ratio_hispanic_house_value_households = col_character(),
        ratio_other_nh_house_value_households = col_character(),
        ratio_white_nh_house_value_households = col_character(),
        ratio_population_pc_physician = col_character(),
        .default = col_double()
      )
  ) %>%
    prep_data()
  
  data_years <- read_csv(
    here("mobility-metrics","00_mobility-metrics_longitudinal.csv"),
    col_type = cols(
      state = col_character(),
      county = col_character(),
      state_name = col_character(),
      county_name = col_character(),
      ratio_black_nh_house_value_households = col_character(),
      ratio_hispanic_house_value_households = col_character(),
      ratio_other_nh_house_value_households = col_character(),
      ratio_white_nh_house_value_households = col_character(),
      ratio_population_pc_physician = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data()
  
  data_race_ethnicity <- read_csv(
    here("mobility-metrics", "01_mobility-metrics_race-ethnicity_longitudinal.csv"), 
    col_types = cols(
      state = col_character(),
      county = col_character(),
      state_name = col_character(),
      county_name = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data()
  
  data_race <- read_csv(
    here("mobility-metrics", "02_mobility-metrics_race_longitudinal.csv"), 
    col_types = cols(
      state = col_character(),
      county = col_character(),
      state_name = col_character(),
      county_name = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data()
  
  data_race_share <- read_csv(
    here("mobility-metrics", "03_mobility-metrics_race-share_longitudinal.csv"), 
    col_types = cols(
      state = col_character(),
      county = col_character(),
      state_name = col_character(),
      county_name = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      .default = col_double()
    )
  ) %>%
    prep_data()
  
  data_education_income <-
    read_csv(
      here("mobility-metrics", "04_SEDA-income_longitudinal.csv"),
      col_types = cols(
        state = col_character(),
        county = col_character(),
        state_name = col_character(),
        county_name = col_character(),
        subgroup_type = col_character(),
        subgroup = col_character(),
        .default = col_double()
      )
    ) %>%
    prep_data()
      
  data_env <-
    read_csv(
      here("mobility-metrics", "04_environmental-exposure_poverty_longitudinal.csv"),
      col_types = cols(
        state = col_character(),
        county = col_character(),
        state_name = col_character(),
        county_name = col_character(),
        subgroup_type = col_character(),
        subgroup = col_character(),
        .default = col_double()
      )
    ) %>%
    prep_data()
  
  data_list <- list(
    recent = data_recent,
    years = data_years,
    race_ethnicity = data_race_ethnicity,
    race = data_race,
    race_share = data_race_share,
    education_income = data_education_income,
    env = data_env
  )
  
  return(data_list)

}