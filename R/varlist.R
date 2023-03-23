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
    "Ratio for extremely low-income households_ci" = "share_affordable_30_ami_ci"
  )
)

housing_insta_varlist <- list(
  summary_vars = c(
    "Number homeless" = "homeless_count", 
    "Share homeless" = "homeless_share"
  ), 
  detail_vars = c(
    "Number homeless" = "homeless_count", 
    note_ul_bound = "homeless_count_ci", 
    "Share homeless" = "homeless_share"
  )
)

econ_inc_varlist <- list(
  summary_vars = c(
    "% in high poverty neighborhoods" = "poverty_exposure"
  ),
  detail_vars = c(
    "% in high poverty neighborhoods" = "poverty_exposure"
  )
)

race_div_varlist <- list(
  summary_vars = c(
    "% for Black, Non-Hispanic" = "black_nh_exposure",
    "% for Black, Non-Hispanic_quality" = "black_nh_exposure_quality", 
    "% for Hispanic" = "hispanic_exposure",
    "% for Hispanic_quality" = "hispanic_exposure_quality",
    "% for Other Races and Ethnicities" = "other_nh_exposure",
    "% for Other Races and Ethnicities_quality" = "other_nh_exposure_quality",
    "% for White, Non-Hispanic" = "white_nh_exposure",
    "% for White, Non-Hispanic_quality" = "white_nh_exposure_quality"
  ),
  detail_vars = c(
    "% for Black, Non-Hispanic" = "black_nh_exposure",
    "% for Black, Non-Hispanic_ci" = "black_nh_exposure_ci",
    "% for Black, Non-Hispanic_quality" = "black_nh_exposure_quality", 
    "% for Hispanic" = "hispanic_exposure",
    "% for Hispanic_ci" = "hispanic_exposure_ci",
    "% for Hispanic_quality" = "hispanic_exposure_quality",
    "% for Other Races and Ethnicities" = "other_nh_exposure",
    "% for Other Races and Ethnicities_ci" = "other_nh_exposure_ci",
    "% for Other Races and Ethnicities_quality" = "other_nh_exposure_quality",
    "% for White, Non-Hispanic" = "white_nh_exposure",
    "% for White, Non-Hispanic_ci" = "white_nh_exposure_ci",
    "% for White, Non-Hispanic_quality" = "white_nh_exposure_quality"
  )
)

trans_access <- list(
  summary_vars = c(
    "Transit trips" = "transit_trips"
  ),
  detail_vars = c(
    "Transit trips" = "transit_trips", 
    "transit_trips_ci" = "Transit trips_ci"
  )
)

trans_cost_varlist <- list(
  summary_vars = c(
    "Transit cost" = "transit_cost"
  ),
  detail_vars = c(
    "Transit cost" = "transit_cost", 
    "Transit cost_ci" = "transit_cost_ci"
  )
)

share_in_presch_varlist <- list(
  summary_vars = c(
    "% Pre-kindergarten" = "share_in_preschool"),
  detail_vars = c(
    "% Pre-kindergarten" = "share_in_preschool", 
    "% Pre-kindergarten_ci" = "share_in_preschool_ci"
  )
)

income_varlist <- list(
  summary_vars = c(
    "20th Percentile" = "pctl_20", 
    "50th Percentile" = "pctl_50", 
    "80th Percentile" = "pctl_80"
  ), 
  detail_vars = c(
    "20th Percentile" = "pctl_20", 
    "50th Percentile" = "pctl_50", 
    "80th Percentile" = "pctl_80"
  )
)

debt_varlist <- list(
  summary_vars = c(
    "% with debt" = "share_debt_coll"
  ),
  detail_vars = c(
    "% with debt" = "share_debt_coll", 
    "% with debt_ci" = "share_debt_coll_ci"
  )
)

accuils_varlist <- list(
  summary_vars = c(
    "HPSA" = "hpsa_yn"
  ), 
  detail_vars = c(
    "HPSA" = "hpsa_yn",
    "HPSA_ci" = "hpsa_yn_ci"
  )
)

neonatal_varlist <- list(
  summary_vars = c(
    "% Low-weight birth" = "lbw"
  ),
  detail_vars = c(
    "% Low-weight birth" = "lbw", 
    "% Low-weight birth_ci" = "lbw_ci"
  )
)

env_varlist <- list(
  summary_vars = c(
    "Air quality index" = "environmental"
  ),
  detail_vars = c(
    "Air quality index" = "environmental", 
    "Air quality index_ci" = "environmental_ci"
  )
)

election_turnout_varlist <- list(
  summary_vars = c(
    "% voting" = "election_turnout"
  ),
  detail_vars = c(
    "% voting" = "election_turnout", 
    "% voting_ci" = "election_turnout_ci"
  )
)

exp_crime_varlist <- list(
  summary_vars = c(
    "Violent crime" = "violent_crime_rate",
    "Property crime" = "property_crime_rate"
  ),
  detail_vars = c(
    "Violent crime" = "violent_crime_rate",
    "Violent crime_ci" = "violent_crime_rate_ci", 
    "Property crime" = "property_crime_rate",
    "Property crime_ci" = "property_crime_rate_ci"
  )
)








