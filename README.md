# Mobility Metrics Data Tables

**Note:** The rendered pages stored in this repository are old. Visit [Measuring Upward Mobility in Counties and Cities Across the US](https://upward-mobility.urban.org/measuring-upward-mobility-counties-and-cities-across-us) to see pages for all 3,143 counties and 486 of the largest cities.

This repository contains tools for iterating Mobility Metrics Data Tables for [Measuring Upward Mobility in Counties and Cities Across the US](https://upward-mobility.urban.org/measuring-upward-mobility-counties-and-cities-across-us). The code iterates 3,143 county websites (example: [Los Angeles County](https://upward-mobility.urban.org/sites/default/files/mobility-metrics-data-pages/999_county-pages/06037/index.html)) and 486 city websites (example: [Philadelphia](https://upward-mobility.urban.org/sites/default/files/mobility-metrics-data-pages/998_place-pages/4260000/index.html)). The following resources feed into the pages:

* [Mobility metrics code](https://github.com/UI-Research/mobility-from-poverty)
* [Mobility metrics Urban Institute Data Catalog page](https://datacatalog.urban.org/dataset/boosting-upward-mobility-metrics-inform-local-action)
* [Mobility metrics data dictionary](https://ui-research.github.io/mobility-from-poverty/)

## Table of Contents

* [Project Background](#project-background)
* [Technical Background](#technical-background)
* [Getting Started](#getting-started)
* [Iteration](#iteration)
* [One-Off Pages](#one-off-pages)
* [Contributors](#contributors)

## Project Background

This repository is only one piece of a multi-year and multi-team effort around boosting upward mobility from poverty. The following resources provide useful background information on the project:

* [Project website](https://upward-mobility.urban.org/)
* [Boosting Upward Mobility: Metrics to Inform Local Action (2nd Edition)](https://www.urban.org/research/publication/boosting-upward-mobility-metrics-inform-local-action-second-edition)
* [Boosting Upward Mobility: Metrics to Inform Local Action Technical Report (2nd Edition)](https://www.urban.org/research/publication/boosting-upward-mobility-metrics-inform-local-action-second-edition-technical-report)

## Technical Background

* [Quarto](https://quarto.org/)
* [Iterated fact sheets with R Markdown](https://medium.com/@urban_institute/iterated-fact-sheets-with-r-markdown-d685eb4eafce)
* [Iterated PDFs with R Markdown](https://medium.com/@urban_institute/iterated-pdfs-with-r-markdown-144e2a6d6a1a).

## Getting started

### R Setup

This code works successfully on `R 4.2.2` and `RStudio 2023.03.0`. Consider updating if you are on older versions of the software and are experiencing issues. 

### Lato font

The Urban Institute uses the font [Lato](https://fonts.google.com/specimen/Lato). Go to `Control Panel` > `Appearance and Personalization` > `Fonts` to see if Lato is installed on your computer. Contact the IT Helpdesk if Lato isn't installed on your computer. 

## Iteration

1. If needed, update `mobility-metrics/` with updated data from the [mobility metrics code](https://github.com/UI-Research/mobility-from-poverty).
2. `R/create_standard_county_df.R` and `R/create_standard_place_df.R` create the data used to iterate the pages. The files created by these scripts, `data/999_all-counties.Rda` and `data/998_all-places.Rda`, rarely need updating. 
3. Launch an EC2 instance with 64 to 128 cores. Memory-optimized machines are ideal.
4. `create_standard_pages.R` iterates the pages. Be sure to set `NCORES` to align with the instance specs from step 3. 
5. Use `aws_cp_command.sh` to copy pages from the EC2 instances to the S3 bucket where pages are hosted and accessible to the [tool interface](https://upward-mobility.urban.org/measuring-upward-mobility-counties-and-cities-across-us). 
6. `test_copy.qmd` ensures that all pages were correctly copied to the S3 bucket.

## One-Off Pages

### Instructions

1. Clone the repository on to your local machine with `git clone https://github.com/UI-Research/gates-mobility-metrics-pages.git`.
2. Create a new branch called `<your-name>` with `git checkout -b <your-name>`.
3. If you had previously completed steps 1 and 2, then confirm you are on the correct branch with `git branch` and run `git pull origin master` to update your local branch with remote changes. 
4. Create a .csv with the name `##_name.csv` (e.g. `01_rfi-applicants.csv`) in the data folder. The file should contain:
    * `state` The state name.
    * `county` The county name. 
    * `fips` [The 5-digit county FIPS code](https://www.nrcs.usda.gov/wps/portal/nrcs/detail/national/home/?cid=nrcs143_013697) for the base county. 
    * `comparisons` 5-digit county FIPS codes separated by semicolons for comparison counties. 
    * `random_id` A 3-digit random ID.  
5. Update `create_bespoke_pages.R`. Add a comment that describes the task and then add `prep_pages()` and `render_pages()`. Run `library(tidyverse)`, `source("R/prep_pages.R")`, and `source("R/render_pages.R")` before running your new lines of code. Don't run other lines of code. 
6. Add the new URLs to the README under a section for the request. 
7. Add, commit, and push your local branch to GitHub with GitHub Bash (your command line tool). 
8. Put in a pull request to the master branch (in the web browser).

## Contributors

### Authors

* Aaron R. Williams
* Gabriel Morrison
* Vivian Zheng
