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
    prep_data() %>%
    select(
      -share_in_preschool_ub,
      -share_in_preschool_lb,
      -share_hs_degree_ub,
      -share_hs_degree_lb,
      -share_employed_ub,
      -share_employed_ub
    )
  
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
    prep_data() %>%
    select(
      -share_in_preschool_ub,
      -share_in_preschool_lb,
      -share_hs_degree_ub,
      -share_hs_degree_lb,
      -share_employed_ub,
      -share_employed_ub
    )
  
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
    prep_data() %>%
    select(
      -share_in_preschool_ub,
      -share_in_preschool_lb,
      -share_hs_degree_ub,
      -share_hs_degree_lb,
      -share_employed_ub,
      -share_employed_ub
    )
  
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
  
  data_pov_exp <- read_csv(
    here("mobility-metrics", "02_poverty-exposure_race-ethnicity.csv"),
    col_types = cols(
      year = col_double(),
      state = col_character(),
      county = col_character(),
      subgroup_type = col_character(),
      subgroup = col_character(),
      share_poverty_exposure = col_double(),
      share_poverty_exposure_quality = col_double()
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
    env = data_env,
    pov_exp = data_pov_exp
  )
  
  return(data_list)

}