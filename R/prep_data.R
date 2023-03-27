prep_data <- function(data) {
  
  data <- data %>% 
    mutate(state = str_pad(state, width = 2, side ="left", pad = "0"), #set max ub as 1 
           county = str_pad(county, width = 3, side ="left", pad = "0"))
  
  data <- data %>% 
    unite("fips", state, county, sep = "", remove = FALSE) %>% 
    # group_by(full_fips) %>% 
    # fill(state_name, .direction = "updown") %>% 
    # fill(county_name, .direction = "updown") %>% 
    # ungroup() %>% 
    unite("state_county", county_name, state_name, sep = ", ", remove = FALSE) %>% 
    filter(fips %in% params$state_county) %>% 
    arrange(factor(fips, levels = params$state_county)) %>% 
    mutate(state_county = gsub("County", "", state_county)) %>% 
    mutate(state_county = rm_white_comma(state_county)) %>%
    mutate_at(vars(ends_with("_quality")),
              function(x) recode(x, `1` = "Good", `2` = "Marginal", `3` = "Poor"))
  
  data <- data %>%
    mutate(state_county = str_to_title(state_county))
  
  # get a full list of variables that are percentage 
  perc_vars_lb <- purrr::map_chr(perc_vars, ~ paste0(., "_lb"))
  perc_vars_ub <- purrr::map_chr(perc_vars, ~ paste0(., "_ub"))
  lst <- list(perc_vars, perc_vars_lb, perc_vars_ub)
  all_perc_vars <- sort(lst %>% reduce(c))
  
  # filter to get the ones only existing in the data 
  perc_vars_in_data <- all_perc_vars[(all_perc_vars %in% colnames(data))]
  
  
  numeric_vars_one_digit <- data %>% 
    select(
      -matches("average_to_living_wage_ratio"),
      -fips, 
      -matches("year"),
      -starts_with("learning_rate"), 
      -all_of(perc_vars_in_data),
      -starts_with("share_burdened"),
      -starts_with("pctl")
    ) %>%
    select_if(is.numeric) %>% 
    names()
  
  
  data <- data %>% 
    # multiple affordable housing variables by 100
    mutate_at(vars(matches("share_affordable_")),  
              function(x) x*100) %>%
    # update ub for share_hs_degree to 1
    mutate_at(vars(matches("share_hs_degree_ub")),     
              function(x) case_when(x > 1 ~ 1, TRUE  ~ x)) %>%
    # convert to percentage
    mutate_at(perc_vars_in_data,             
              function (x) scales::percent(x, accuracy = 0.1)) %>%
    mutate_at(numeric_vars_one_digit,
              function(x) {format(round(x, 1), big.mark=",", scientific=FALSE)}) %>%
    mutate_at(vars(matches("average_to_living_wage_ratio")), funs(as.numeric)) %>%
    mutate_at(vars(matches("average_to_living_wage_ratio")),
              function(x) {format(round(x, 2), big.mark=",",scientific=FALSE)}) %>%
    # mutate(na_quality = "NA")  %>%  #to be used for metrics where there is no quality variable %>%
    mutate_at(vars(matches("pctl"), -ends_with("_quality")), 
              function(x) scales::dollar(x, accuracy = 1)) %>%
    # remove whitespace in values  
    mutate_at(vars(-one_of(c("state_county", "subgroup"))),
              function(x) gsub("\\s+", "", x)) %>%  
    mutate_at(vars(matches("crime_rate"), -ends_with("_quality")), 
              function(x) gsub("\\..*","", x)) %>%
    mutate_at(vars(ends_with("_quality")),
              function(x) recode(x, `1` = "Good", `2` = "Marginal", `3` = "Poor"))
  
  
  return(data)
  
}
