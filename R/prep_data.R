prep_data <- function(data) {
  
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
  
  return(data)
  
}
