
###################################################################

# TA Request Code: RMAPI via Aqua Porter, 09/2023 via email
# Tina Chelidze 2023
# Wants excel file of all the metrics data for 6 counties and 5 cities of interest
# Imported files are all pulled from Urban Data Catalog
# https://datacatalog.urban.org/dataset/boosting-upward-mobility-metrics-inform-local-action-10

###################################################################


# Import the county-level data files
county_long <- read_csv("C:/Users/tchelidze/Downloads/00_mobility-metrics_longitudinal.csv")  
county_race_eth <- read_csv("C:/Users/tchelidze/Downloads/01_mobility-metrics_race-ethnicity_longitudinal.csv")  
county_race <- read_csv("C:/Users/tchelidze/Downloads/02_mobility-metrics_race_longitudinal.csv")  
county_povexp <- read_csv("C:/Users/tchelidze/Downloads/02_poverty-exposure_race-ethnicity.csv")  
county_income <- read_csv("C:/Users/tchelidze/Downloads/04_SEDA-income_longitudinal.csv")  


# Import the city-level data files
place_long <- read_csv("C:/Users/tchelidze/Downloads/05_mobility-metrics_place_longitudinal.csv")  
place_race_eth <- read_csv("C:/Users/tchelidze/Downloads/06_mobility-metrics_place_race-ethnicity_longitudinal.csv")  
place_race <- read_csv("C:/Users/tchelidze/Downloads/07_mobility-metrics_place_race_longitudinal.csv")  
place_povexp <- read_csv("C:/Users/tchelidze/Downloads/07_poverty-exposure_city_subgroup.csv")  
place_income <- read_csv("C:/Users/tchelidze/Downloads/09_place_SEDA-income_longitudinal.csv")  


# COUNTIES
# Monroe County, New York
# 36055
# Erie County, New York
# 36029
# Montgomery County, Ohio
# 39113
# Milwaukee County, Wisconsin
# 55079
# Onondaga County, New York
# 36067
# Summit County, Ohio
# 39153


# Limit county files to the counties we care about
county_long <- county_long %>%
  filter(state == "36" & county == "055" |
         state == "36" & county == "029" |
         state == "39" & county == "113" |
         state == "55" & county == "079" |
         state == "36" & county == "067" |
         state == "39" & county == "153")


county_povexp <- county_povexp %>%
  filter(state == "36" & county == "055" |
           state == "36" & county == "029" |
           state == "39" & county == "113" |
           state == "55" & county == "079" |
           state == "36" & county == "067" |
           state == "39" & county == "153")

county_race <- county_race %>%
  filter(state == "36" & county == "055" |
           state == "36" & county == "029" |
           state == "39" & county == "113" |
           state == "55" & county == "079" |
           state == "36" & county == "067" |
           state == "39" & county == "153")

county_race_eth <- county_race_eth %>%
  filter(state == "36" & county == "055" |
           state == "36" & county == "029" |
           state == "39" & county == "113" |
           state == "55" & county == "079" |
           state == "36" & county == "067" |
           state == "39" & county == "153")

county_income <- county_income %>%
  filter(state == "36" & county == "055" |
           state == "36" & county == "029" |
           state == "39" & county == "113" |
           state == "55" & county == "079" |
           state == "36" & county == "067" |
           state == "39" & county == "153")



# CITIES
# Buffalo, NY
# NY|36|11000|00978764|Buffalo city|
# Syracuse, NY
# NY|36|73000|00979539|Syracuse city|
# Dayton, OH
# OH|39|21000|01086167|Dayton city|
# Akron, OH
# OH|39|01000|01086993|Akron city|
# Milwaukee, Wisconsin
# WI|55|53000|01583724|Milwaukee city|

# Limit city files to the counties we care about

place_long <- place_long %>%
  filter(state == "36" & place == "11000" |
         state == "36" & place == "73000" |
         state == "39" & place == "21000" |
         state == "55" & place == "53000" |
         state == "39" & place == "01000")


place_povexp <- place_povexp %>%
  filter(state == "36" & place == "11000" |
         state == "36" & place == "73000" |
         state == "39" & place == "21000" |
         state == "55" & place == "53000" |
         state == "39" & place == "01000")


place_income <- place_income %>%
  filter(state == "36" & place == "11000" |
         state == "36" & place == "73000" |
         state == "39" & place == "21000" |
         state == "55" & place == "53000" |
         state == "39" & place == "01000")


place_race <- place_race %>%
  filter(state == "36" & place == "11000" |
         state == "36" & place == "73000" |
         state == "39" & place == "21000" |
         state == "55" & place == "53000" |
         state == "39" & place == "01000")


place_race_eth <- place_race_eth %>%
  filter(state == "36" & place == "11000" |
         state == "36" & place == "73000" |
         state == "39" & place == "21000" |
         state == "55" & place == "53000" |
         state == "39" & place == "01000")


# Rename variables as needed to append county & place files together to minimize output files

# "income" file - rename vars to allow append
county_income <- county_income %>%
  dplyr::rename(geo = county,
                geo_name = county_name)
place_income <- place_income %>%
  dplyr::rename(geo = place,
                geo_name = place_name)
# append
income <- rbind(county_income, place_income)


# "povexp" file - rename vars to allow append
county_povexp <- county_povexp %>%
  dplyr::rename(geo = county,
                geo_name = county_name)
place_povexp <- place_povexp %>%
  dplyr::rename(geo = place,
                geo_name = place_name)
# append
povexp <- rbind(county_povexp, place_povexp)


# "race" file - rename vars to allow append
place_race$population <- rep(NA)
county_race <- county_race %>%
  dplyr::rename(geo = county,
                geo_name = county_name)
place_race <- place_race %>%
  dplyr::rename(geo = place,
                geo_name = place_name)
# append
race <- rbind(county_race, place_race)


# I can't combine county/place_long or _race_eth files because they have different variables, so will need to output both geos


# Save all files to local drive in order to zip & send off
write_csv(income, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/SEDA-income_longitudinal-Counties+Cities.csv")  
write_csv(povexp, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/poverty-exposure_race-ethnicity-Counties+Cities.csv")  
write_csv(race, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/mobility-metrics_race_longitudinal-Counties+Cities.csv")  

write_csv(county_long, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/mobility-metrics_longitudinal-Counties.csv")  
write_csv(place_long, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/mobility-metrics_longitudinal-Cities.csv")  
write_csv(county_race_eth, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/mobility-metrics_race-ethnicity_longitudinal-Counties.csv")  
write_csv(place_race_eth, "C:/Users/tchelidze/Documents/GitHub/gates-mobility-metrics-pages/data-requests/RMAPI/mobility-metrics_race-ethnicity_longitudinal-Cities.csv")  

