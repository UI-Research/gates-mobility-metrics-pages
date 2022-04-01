library(tidyverse)

files <- list.files("data-requests/philadelphia/", full.names = TRUE)

fips <- c("42101", "24510", "17031", "13121")

filter_data <- function(file, fips) {
  
  read_csv(file) %>%
    filter(paste0(state, county) %in% fips) %>%
    write_csv(file)
  
}

map(files, filter_data, fips = fips)


