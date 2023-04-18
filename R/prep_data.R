prep_data <- function(data, geography = "county") {
  
  # Get a list of all variables that should be presented as percentage 
  perc_vars <- c(
    "share_debt_col", # % with debt
    "share_homeless", # share homeless
    "share_election_turnout", # % voting 
    "rate_low_birth_weight", # % low birthweight
    "share_white_nh_exposure",
    "share_black_nh_exposure",
    "share_hispanic_exposure",
    "share_other_nh_exposure",
    "share_poverty_exposure", # % in high poverty
    "meps20_total", # student poverty concentration
    "meps20_white", 
    "meps20_black",
    "meps20_hispanic", 
    "share_in_preschool", # % in pre k 
    "share_hs_degree", # % with HS degree
    "share_employed",
    "share_digital_access"
  )
  
  if (geography == "county") {
    
    data <- data %>% 
      mutate(
        state = str_pad(state, width = 2, side ="left", pad = "0"), 
        county = str_pad(county, width = 3, side ="left", pad = "0"),
        fips = paste0(state, county)
      )
    
    data <- data %>% 
      filter(fips %in% params$state_county) %>% 
      arrange(factor(fips, levels = params$state_county)) %>% 
      unite("state_county", county_name, state_name, sep = ", ", remove = FALSE) %>% 
      mutate(state_county = gsub("County", "", state_county)) %>% 
      mutate(state_county = qdapRegex::rm_white_comma(state_county))
    
    data <- data %>%
      mutate(state_county = str_to_title(state_county))
    
  } else if (geography == "place") {
    
    data <- data %>% 
      mutate(
        state = str_pad(state, width = 2, side = "left", pad = "0"), 
        place = str_pad(place, width = 5, side = "left", pad = "0"),
        fips = paste0(state, place)
      )
    
    data <- data %>% 
      filter(fips %in% params$state_place) %>% 
      arrange(factor(fips, levels = params$state_place)) %>% 
      # keeping as state_county to simplify downstream code
      unite("state_county", place_name, state_name, sep = ", ", remove = FALSE) %>% 
      mutate(state_county = gsub("City", "", state_county)) %>% 
      mutate(state_county = qdapRegex::rm_white_comma(state_county))
    
    data <- data %>%
      mutate(state_county = str_to_title(state_county))
    
  }
  
  # get a full list of variables that are percentage 
  perc_vars_lb <- purrr::map_chr(perc_vars, ~ paste0(., "_lb"))
  perc_vars_ub <- purrr::map_chr(perc_vars, ~ paste0(., "_ub"))
  lst <- list(perc_vars, perc_vars_lb, perc_vars_ub)
  all_perc_vars <- sort(lst %>% reduce(c))
  
  # filter to get the ones only existing in the data 
  perc_vars_in_data <- all_perc_vars[(all_perc_vars %in% colnames(data))]
  
  numeric_vars_one_digit <- data %>% 
    select(
      -matches("ratio_average_to_living_wage"),
      -matches("share_desc_rep"), 
      -fips, 
      -matches("_quality"),
      -matches("year"),
      -starts_with("rate_learning"), 
      -all_of(perc_vars_in_data),
      -starts_with("pctl")
    ) %>%
    select_if(is.numeric) %>% 
    names()
  
  
  data <- data %>%
    mutate_at(vars(ends_with("_quality")),
              function(x) recode(x, `1` = "Strong", `2` = "Marginal", `3` = "Weak")) %>% 
    mutate(
      across(
        any_of(c("rate_learning", "rate_learning_lb", "rate_learning_ub")),
        .fns = ~round(.x, digits = 2)
      )
    ) %>%
    # multiple affordable housing variables by 100
    mutate_at(vars(matches("share_affordable_[1-9]")),  
              function(x) x*100) %>%
    # update ub for share_hs_degree to 1
    mutate_at(vars(matches("share_hs_degree_ub")),     
              function(x) case_when(x > 1 ~ 1, TRUE  ~ x)) %>%
    mutate_at(vars(any_of(c("share_desc_rep_asian_other", 
                            "share_desc_rep_black_nonhispanic", 
                            "share_desc_rep_hispanic", 
                            "share_desc_rep_white_nonhispanic"))),
              function(x) paste0("__:", scales::percent(x))) %>%    
    # convert to percentage
    mutate_at(perc_vars_in_data,             
              function (x) scales::percent(x, accuracy = 0.1)) %>%
    mutate_at(numeric_vars_one_digit,
              function(x) {format(round(x, 1), big.mark=",", scientific=FALSE)}) %>%
    mutate_at(vars(any_of("ratio_average_to_living_wage")), funs(as.numeric)) %>%
    mutate_at(vars(any_of("ratio_average_to_living_wage")),
              function(x) {format(round(x, 2), big.mark=",",scientific=FALSE)}) %>%
    mutate_at(vars(matches("pctl"), -ends_with("_quality")), 
              function(x) scales::dollar(x, accuracy = 1)) %>%
    # remove whitespace in values  
    mutate_at(vars(-one_of(c("state_county", "subgroup"))),
              function(x) gsub("\\s+", "", x)) %>%  
    mutate_at(vars(matches("crime_violent_rate"), matches("crime_property_rate"), -ends_with("_quality")), 
              function(x) gsub("\\..*","", x)) 
      
      
  
  return(data)
  
}
