#' Create a city extract of mobility metrics data
#'
#' @param fips A vector of state+place FIPS codes
#' @param output_dir A character string with the name of the output directory
#'
#' @return Mobility metrics subsetted as .csv files in the output_dir
#' 
create_place_extract <- function(fips, output_dir) {
  
  # create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    
    dir.create(output_dir)
    
  }
  
  # load place longitudinal file
  longitudinal_file <- readr::read_csv(
    file = "mobility-metrics/05_mobility-metrics_place_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips)
  
  # create FIPS and missing FIPS
  longitudinal_file_fips <- longitudinal_file |>
    dplyr::mutate(fips = paste0(state, place)) |>
    dplyr::pull(fips) |>
    unique()
  
  missing_longitudinal_file_fips <- 
    fips[!fips %in% longitudinal_file_fips]
  
  # return diagnostic message
  message(
    paste("Queried FIPS in data:", paste(longitudinal_file_fips, collapse = ", "), "\n"),
    paste("Queried FIPS not in data:", paste(missing_longitudinal_file_fips, collapse = ", "))
  )
  
  # Place Longitudinal Data
  longitudinal_file |>
    readr::write_csv(paste0(output_dir, "/05_mobility-metrics_place_longitudinal.csv"))
  
  # Place Race/Ethnicity Data
  readr::read_csv(
    file = "mobility-metrics/06_mobility-metrics_place_race-ethnicity_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/06_mobility-metrics_place_race-ethnicity_longitudinal.csv"))
  
  # Place Race Data
  readr::read_csv(
    file = "mobility-metrics/07_mobility-metrics_place_race_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/07_mobility-metrics_place_race_longitudinal.csv"))
  
  # Place Poverty Exposure Data
  readr::read_csv(
    file = "mobility-metrics/07_poverty-exposure_city_subgroup.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/07_poverty-exposure_city_subgroup.csv"))
  
  # Place Race Share Data
  readr::read_csv(
    "mobility-metrics/08_place_mobility-metrics_race-share_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/08_place_mobility-metrics_race-share_longitudinal.csv"))
  
  # Place Income Data
  readr::read_csv(
    file = "mobility-metrics/09_place_SEDA-income_longitudinal.csv", 
    show_col_types = FALSE
  ) |>
    dplyr::filter(paste0(state, place) %in% fips) |>
    readr::write_csv(paste0(output_dir, "/09_place_SEDA-income_longitudinal.csv"))
  
  
}
