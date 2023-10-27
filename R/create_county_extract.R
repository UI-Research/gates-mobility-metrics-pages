#' Create a county extract of mobility metrics data
#'
#' @param fips A vector of state+county FIPS codes
#' @param output_dir A character string with the name of the output directory
#'
#' @return Mobility metrics subsetted as .csv files in the output_dir
#' 
create_county_extract <- function(fips, output_dir) {
  
  # create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    
    dir.create(output_dir)
    
  }
  
  # load county longitudinal file
  longitudinal_file <- readr::read_csv(
    file = "mobility-metrics/00_mobility-metrics_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips)
  
  # create FIPS and missing FIPS
  longitudinal_file_fips <- longitudinal_file |>
    dplyr::mutate(fips = paste0(state, county)) |>
    dplyr::pull(fips) |>
    unique()
  
  missing_longitudinal_file_fips <- 
    fips[!fips %in% longitudinal_file_fips]
  
  # return diagnostic message
  message(
    paste("Queried FIPS in data:", paste(longitudinal_file_fips, collapse = ", "), "\n"),
    paste("Queried FIPS not in data:", paste(missing_longitudinal_file_fips, collapse = ", "))
  )

  # County Longitudinal Data
  longitudinal_file |>
    readr::write_csv(paste0(output_dir, "/00_mobility-metrics_longitudinal.csv"))
  
  # County Race/Ethnicity Data
  readr::read_csv(
    file = "mobility-metrics/01_mobility-metrics_race-ethnicity_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/01_mobility-metrics_race-ethnicity_longitudinal.csv"))
  
  # County Race Data
  readr::read_csv(
    file = "mobility-metrics/02_mobility-metrics_race_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/02_mobility-metrics_race_longitudinal.csv"))
  
  # County Poverty Exposure Data
  readr::read_csv(
    file = "mobility-metrics/02_poverty-exposure_race-ethnicity.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/02_poverty-exposure_race-ethnicity.csv"))
  
  # County Race Share Data
  readr::read_csv(
    "mobility-metrics/03_mobility-metrics_race-share_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/03_mobility-metrics_race-share_longitudinal.csv"))
  
  # County Income Data
  readr::read_csv(
    file = "mobility-metrics/04_SEDA-income_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, county) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/04_SEDA-income_longitudinal.csv"))

}


