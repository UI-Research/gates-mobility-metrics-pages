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
    "housing_quality" = "housing_quality"
  )
)

housing_insta_varlist <- list(
  summary_vars = c(
    "Number homeless" = "homeless_count", 
    "Share homeless" = "homeless_share"
  ), 
  detail_vars = c(
    "Number homeless" = "homeless_count", 
    "Lower/Upper bound" = "homeless_count_ci", 
    "Share homeless" = "homeless_share",
    "homeless_quality" = "homeless_quality"
  )
)

econ_inc_varlist <- list(
  summary_vars = c(
    "% in high poverty neighborhoods" = "poverty_exposure"
  ),
  detail_vars = c(
    "% in high poverty neighborhoods" = "poverty_exposure",
    "poverty_exposure_quality" = "poverty_exposure_quality"
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
    "transit_trips_ci" = "Transit trips_ci",
    "transit_trips_quality" = "transit_trips_quality"
  )
)

trans_cost_varlist <- list(
  summary_vars = c(
    "Transit cost" = "transit_cost"
  ),
  detail_vars = c(
    "Transit cost" = "transit_cost", 
    "Transit cost_ci" = "transit_cost_ci",
    "transit_cost_quality" = "transit_cost_quality"
  )
)

share_in_presch_varlist <- list(
  summary_vars = c(
    "% Pre-kindergarten" = "share_in_preschool"),
  detail_vars = c(
    "% Pre-kindergarten" = "share_in_preschool", 
    "% Pre-kindergarten_ci" = "share_in_preschool_ci",
    "preschool_quality" = "preschool_quality"
  )
)

eff_pub_ed <- list(
  summary_vars = c(
    "Annual ELA achievement" = "learning_rate"
  ),
  detail_vars = c(
    "Annual ELA achievement" = "learning_rate", 
    "Lower/Upper bound" = "learning_rate_ci",
    "learning_rate_quality" = "learning_rate_quality"
  )
)

stu_poverty_varlist <- list(
  summary_vars = c(
    "% for White, non-Hispanic" = "frpl40_white", 
    "% for White, non-Hispanic_quality" = "frpl40_white_quality",
    "% for Black, non-Hispanic" = "frpl40_black",
    "% for Black, non-Hispanic_quality" = "frpl40_black_quality",
    "% for Hispanic" = "frpl40_hispanic", 
    "% for Hispanic_quality" = "frpl40_hispanic_quality"
  ),
  detail_vars = c(
    "% for White, non-Hispanic" = "frpl40_white", 
    "% for White, non-Hispanic_ci" = "frpl40_white_ci", 
    "% for White, non-Hispanic_quality" = "frpl40_white_quality",
    "% for Black, non-Hispanic" = "frpl40_black",
    "% for Black, non-Hispanic_ci" = "frpl40_black_ci", 
    "% for Black, non-Hispanic_quality" = "frpl40_black_quality",
    "% for Hispanic" = "frpl40_hispanic", 
    "% for Hispanic_ci" = "frpl40_hispanic_ci",
    "% for Hispanic_quality" = "frpl40_hispanic_quality"
  )
)

college_readiness <- list(
  summary_vars = c(
    "% HS degree" = "share_hs_degree"
  ),
  detail_vars = c(
    "% HS degree" = "share_hs_degree", 
    "% HS degree_ci" = "share_hs_degree_ci",
    "hs_degree_quality" = "hs_degree_quality"
  )
)

emp_lst <- list(
  summary_vars = c(
    "Employment to population ratio" = "share_employed"
  ),
  detail_vars = c(
    "Employment to population ratio" = "share_employed", 
    "Employment to population ratio_ci" = "share_employed_ci",
    "employed_quality" = "employed_quality"
  )
)

job_wage <- list(
  summary_vars = c(
    "Ratio of pay to living wage" = "average_to_living_wage_ratio"
  ),
  detail_vars = c(
    "Ratio of pay to living wage" = "average_to_living_wage_ratio", 
    "Ratio of pay to living wage_ci" = "average_to_living_wage_ratio_ci",
    "wage_ratio_quality" = "wage_ratio_quality"
  )
)


income_varlist <- list(
  summary_vars = c(
    "20th Percentile" = "pctl_20", 
    "50th Percentile" = "pctl_50", 
    "80th Percentile" = "pctl_80",
    "pctl_quality" = "pctl_quality"
  ), 
  detail_vars = c(
    "20th Percentile" = "pctl_20", 
    "50th Percentile" = "pctl_50", 
    "80th Percentile" = "pctl_80",
    "pctl_quality" = "pctl_quality"
  )
)

debt_varlist <- list(
  summary_vars = c(
    "% with debt" = "share_debt_coll"
  ),
  detail_vars = c(
    "% with debt" = "share_debt_coll", 
    "% with debt_ci" = "share_debt_coll_ci",
    "share_debt_coll_quality" = "share_debt_coll_quality"
  )
)

accuils_varlist <- list(
  summary_vars = c(
    "Ratio of physicians to people" = "pc_phys_ratio"
  ), 
  detail_vars = c(
    "Ratio of physicians to people" = "pc_phys_ratio",
    "Ratio of physicians to people_ci" = "pc_phys_ratio_ci",
    "pc_phys_ratio_quality" = "pc_phys_ratio_quality"
  )
)

neonatal_varlist <- list(
  summary_vars = c(
    "% Low-weight birth" = "lbw"
  ),
  detail_vars = c(
    "% Low-weight birth" = "lbw", 
    "% Low-weight birth_ci" = "lbw_ci",
    "lbw_quality" = "lbw_quality"
  )
)

env_varlist <- list(
  summary_vars = c(
    "Air quality index" = "environmental"
  ),
  detail_vars = c(
    "Air quality index" = "environmental", 
    "Air quality index_ci" = "environmental_ci",
    "environmental_quality" = "environmental_quality"
  )
)

election_turnout_varlist <- list(
  summary_vars = c(
    "% voting" = "election_turnout"
  ),
  detail_vars = c(
    "% voting" = "election_turnout", 
    "% voting_ci" = "election_turnout_ci",
    "election_turnout_quality" = "election_turnout_quality"
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
    "Property crime_ci" = "property_crime_rate_ci",
    "crime_rate_quality" = "crime_rate_quality"
  )
)








