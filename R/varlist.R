housing_varlist <- list(
  summary_vars = c(
    "Ratio for low-income households" = "share_affordable_80_ami", 
    "Ratio for very low-income households" = "share_affordable_50_ami",
    "Ratio for extremely low-income households" = "share_affordable_30_ami"
  ), 
  detail_vars = c(
    "Ratio for low-income households" = "share_affordable_80_ami", 
    "Ratio for low-income households_ci" = "share_affordable_80_ami_ci", 
    "Ratio for very low-income households" = "share_affordable_50_ami",
    "Ratio for very low-income households_ci" = "share_affordable_50_ami_ci",
    "Ratio for extremely low-income households" = "share_affordable_30_ami",
    "Ratio for extremely low-income households_ci" = "share_affordable_30_ami_ci",
    "share_affordable_quality" = "share_affordable_quality"
  )
)

housing_insta_varlist <- list(
  summary_vars = c(
    "Number homeless" = "count_homeless", 
    "Share homeless" = "share_homeless"
  ), 
  detail_vars = c(
    "Number homeless" = "count_homeless", 
    "Lower/Upper bound" = "count_homeless_ci", 
    "Share homeless" = "share_homeless",
    "homeless_quality" = "homeless_quality"
  )
)

econ_inc_varlist <- list(
  summary_vars = c(
    "% in high poverty neighborhoods" = "share_poverty_exposure"
  ),
  detail_vars = c(
    "% in high poverty neighborhoods" = "share_poverty_exposure",
    "share_poverty_exposure_quality" = "share_poverty_exposure_quality"
  )
)

race_div_varlist <- list(
  summary_vars = c(
    "% for Black, Non-Hispanic" = "share_black_nh_exposure",
    "% for Black, Non-Hispanic_quality" = "share_black_nh_exposure_quality", 
    "% for Hispanic" = "share_hispanic_exposure",
    "% for Hispanic_quality" = "share_hispanic_exposure_quality",
    "% for Other Races and Ethnicities" = "share_other_nh_exposure",
    "% for Other Races and Ethnicities_quality" = "share_other_nh_exposure_quality",
    "% for White, Non-Hispanic" = "share_white_nh_exposure",
    "% for White, Non-Hispanic_quality" = "share_white_nh_exposure_quality"
  ),
  detail_vars = c(
    "% for Black, Non-Hispanic" = "share_black_nh_exposure",
    "% for Black, Non-Hispanic_quality" = "share_black_nh_exposure_quality", 
    "% for Hispanic" = "share_hispanic_exposure",
    "% for Hispanic_quality" = "share_hispanic_exposure_quality",
    "% for Other Races and Ethnicities" = "share_other_nh_exposure",
    "% for Other Races and Ethnicities_quality" = "share_other_nh_exposure_quality",
    "% for White, Non-Hispanic" = "share_white_nh_exposure",
    "% for White, Non-Hispanic_quality" = "share_white_nh_exposure_quality"
  )
)

trans_access <- list(
  summary_vars = c(
    "Transit trips" = "index_transit_trips"
  ),
  detail_vars = c(
    "Transit trips" = "index_transit_trips", 
    "transit_trips_ci" = "Transit trips_ci",
    "index_transit_trips_quality" = "index_transit_trips_quality"
  )
)

trans_cost_varlist <- list(
  summary_vars = c(
    "Transportation cost" = "transportation_cost"
  ),
  detail_vars = c(
    "Transportation cost" = "transportation_cost", 
    "Transportation cost_ci" = "transportation_cost_ci",
    "transportation_cost_quality" = "transportation_cost_quality"
  )
)

share_in_presch_varlist <- list(
  summary_vars = c(
    "% Pre-kindergarten" = "share_in_preschool"),
  detail_vars = c(
    "% Pre-kindergarten" = "share_in_preschool", 
    "% Pre-kindergarten_ci" = "share_in_preschool_ci",
    "share_in_preschool_quality" = "share_in_preschool_quality"
  )
)

eff_pub_ed <- list(
  summary_vars = c(
    "Annual ELA achievement" = "rate_learning"
  ),
  detail_vars = c(
    "Annual ELA achievement" = "rate_learning", 
    "Lower/Upper bound" = "rate_learning_ci",
    "learning_rate_quality" = "rate_learning_quality"
  )
)

stu_poverty_varlist <- list(
  summary_vars = c(
    "% for White, non-Hispanic" = "meps20_white", 
    "% for White, non-Hispanic_quality" = "meps20_white_quality",
    "% for Black, non-Hispanic" = "meps20_black",
    "% for Black, non-Hispanic_quality" = "meps20_black_quality",
    "% for Hispanic" = "meps20_hispanic", 
    "% for Hispanic_quality" = "meps20_hispanic_quality"
  ),
  detail_vars = c(
    "% for White, non-Hispanic" = "meps20_white", 
    "% for White, non-Hispanic_ci" = "meps20_white_ci", 
    "% for White, non-Hispanic_quality" = "meps20_white_quality",
    "% for Black, non-Hispanic" = "meps20_black",
    "% for Black, non-Hispanic_ci" = "meps20_black_ci", 
    "% for Black, non-Hispanic_quality" = "meps20_black_quality",
    "% for Hispanic" = "meps20_hispanic", 
    "% for Hispanic_ci" = "meps20_hispanic_ci",
    "% for Hispanic_quality" = "meps20_hispanic_quality"
  )
)

college_readiness <- list(
  summary_vars = c(
    "% HS degree" = "share_hs_degree"
  ),
  detail_vars = c(
    "% HS degree" = "share_hs_degree", 
    "% HS degree_ci" = "share_hs_degree_ci",
    "share_hs_degree_quality" = "share_hs_degree_quality"
  )
)

emp_lst <- list(
  summary_vars = c(
    "Employment to population ratio" = "share_employed"
  ),
  detail_vars = c(
    "Employment to population ratio" = "share_employed", 
    "Employment to population ratio_ci" = "share_employed_ci",
    "share_employed_quality" = "share_employed_quality"
  )
)

job_wage <- list(
  summary_vars = c(
    "Ratio of pay to living wage" = "ratio_average_to_living_wage"
  ),
  detail_vars = c(
    "Ratio of pay to living wage" = "ratio_average_to_living_wage", 
    "ratio_average_to_living_wage_quality" = "ratio_average_to_living_wage_quality"
  )
)


income_varlist <- list(
  summary_vars = c(
    "20th Percentile" = "pctl_income_20", 
    "50th Percentile" = "pctl_income_50", 
    "80th Percentile" = "pctl_income_80",
    "pctl_income_quality" = "pctl_income_quality"
  ), 
  detail_vars = c(
    "20th Percentile" = "pctl_income_20", 
    "50th Percentile" = "pctl_income_50", 
    "80th Percentile" = "pctl_income_80",
    "pctl_income_quality" = "pctl_income_quality"
  )
)

debt_varlist <- list(
  summary_vars = c(
    "% with debt" = "share_debt_col"
  ),
  detail_vars = c(
    "% with debt" = "share_debt_col", 
    "% with debt_ci" = "share_debt_col_ci",
    "share_debt_col_quality" = "share_debt_col_quality"
  )
)

accuils_varlist <- list(
  summary_vars = c(
    "Ratio of people to physicians" = "ratio_population_pc_physician"
  ), 
  detail_vars = c(
    "Ratio of people to physicians" = "ratio_population_pc_physician",
    "Ratio of people to physicians_ci" = "ratio_population_pc_physician_ci",
    "ratio_population_pc_physician_quality" = "ratio_population_pc_physician_quality"
  )
)

neonatal_varlist <- list(
  summary_vars = c(
    "% Low birth weight" = "rate_low_birth_weight"
  ),
  detail_vars = c(
    "% Low birth weight" = "rate_low_birth_weight", 
    "% Low birth weight_ci" = "rate_low_birth_weight_ci",
    "rate_low_birth_weight_quality" = "rate_low_birth_weight_quality"
  )
)

env_varlist <- list(
  summary_vars = c(
    "Air quality index" = "air_quality_index"
  ),
  detail_vars = c(
    "Air quality index" = "air_quality_index", 
    "Air quality index_ci" = "air_quality_index_ci",
    "air_quality_index_quality" = "air_quality_index_quality"
  )
)

election_turnout_varlist <- list(
  summary_vars = c(
    "% voting" = "share_election_turnout"
  ),
  detail_vars = c(
    "% voting" = "share_election_turnout", 
    "% voting_ci" = "share_election_turnout_ci",
    "share_election_turnout_quality" = "share_election_turnout_quality"
  )
)

exp_crime_varlist <- list(
  summary_vars = c(
    "Violent crime" = "rate_violent_crime",
    "Property crime" = "rate_property_crime"
  ),
  detail_vars = c(
    "Violent crime" = "rate_violent_crime",
    "Property crime" = "rate_property_crime",
    "rate_crime_quality" = "rate_crime_quality"
  )
)

just_policing_varlist <- list(
  summary_vars = c(
    "Juvenile arrest rate" = "rate_juv_arrest"
  ),
  detail_vars = c(
    "Juvenile arrest rate" = "rate_juv_arrest",
    "rate_juv_arrest_quality" = "rate_juv_arrest_quality"
  )
)

social_capital1_varlist <- list(
  summary_vars = c(
    "Membership associations" = "count_membership_associations_per_10k"
  ),
  detail_vars = c(
    "Membership associations" = "count_membership_associations_per_10k",
    "count_membership_associations_per_10k_quality" = "count_membership_associations_per_10k_quality"
  )
)

social_capital2_varlist <- list(
  summary_vars = c(
    "Economic connectedness" = "ratio_high_low_ses_fb_friends"
  ),
  detail_vars = c(
    "Economic connectedness" = "ratio_high_low_ses_fb_friends",
    "ratio_high_low_ses_fb_friends_quality" = "ratio_high_low_ses_fb_friends_quality"
  )
)

digital_access_varlist <- list(
  summary_vars = c(
    "% Digital access" = "share_digital_access"
  ),
  detail_vars = c(
    "% Digital access" = "share_digital_access",
    "digital_access_quality" = "share_digital_access_quality"
  )
)

wealth_building_varlist <- list(
  summary_vars = c(
    "Black, non-Hispanic Opportunity" = "ratio_black_nh_house_value_households",
    "Hispanic Opportunity" = "ratio_hispanic_house_value_households",
    "Other Races and Ethnicities Opportunity" = "ratio_other_nh_house_value_households",
    "White, non-Hispanic Opportunity" = "ratio_white_nh_house_value_households"
  ),
  detail_vars = c(
    "Black, non-Hispanic Opportunity" = "ratio_black_nh_house_value_households",
    "ratio_black_nh_house_value_households_quality" = "ratio_black_nh_house_value_households_quality",
    "Hispanic Opportunity" = "ratio_hispanic_house_value_households",
    "ratio_hispanic_house_value_households_quality" = "ratio_hispanic_house_value_households_quality",
    "Other Races and Ethnicities Opportunity" = "ratio_other_nh_house_value_households",
    "ratio_other_nh_house_value_households_quality" = "ratio_other_nh_house_value_households_quality",
    "White, non-Hispanic Opportunity" = "ratio_white_nh_house_value_households",
    "ratio_white_nh_house_value_households_quality" = "ratio_white_nh_house_value_households_quality"
  )
)

trauma_varlist <- list(
  summary_vars = c(
    "Trauma" = "rate_injury_death"
  ),
  detail_vars = c(
    "Trauma" = "rate_injury_death",
    "Trauma_ci" = "rate_injury_death_ci",
    "rate_injury_death_quality" = "rate_injury_death_quality"
  )
)

descriptive_representation_varlist <- list(
  summary_vars = c(
    "Other Races/Ethnicities" = "share_desc_rep_asian_other",
    "Black, non-Hispanic" = "share_desc_rep_black_nonhispanic",
    "Hispanic" = "share_desc_rep_hispanic",
    "White, non-Hispanic" = "share_desc_rep_white_nonhispanic"
  ),
  detail_vars = c(
    "Other Races/Ethnicities" = "share_desc_rep_asian_other",
    "share_desc_rep_asian_other_quality" = "share_desc_rep_asian_other_quality",
    "Black, non-Hispanic" = "share_desc_rep_black_nonhispanic",
    "share_desc_rep_black_nonhispanic_quality" = "share_desc_rep_black_nonhispanic_quality",
    "Hispanic" = "share_desc_rep_hispanic",
    "hispanic_pop_quality" = "share_desc_rep_hispanic_quality",
    "White, non-Hispanic" = "share_desc_rep_white_nonhispanic",
    "share_desc_rep_white_nonhispanic_quality" = "share_desc_rep_white_nonhispanic_quality"
  )
)



