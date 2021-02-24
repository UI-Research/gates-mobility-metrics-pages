# Gates Mobility Metrics Pages

## Overview

This repository contains tools for iterating data pages with data from the Boosting Upward Mobility project. The repository does not contain any data pages but it contains all the necessary code to create the data pages. 

### Project Background

* [Boosting Upward Mobility: Metrics to Inform Local Action](https://www.urban.org/research/publication/boosting-upward-mobility-metrics-inform-local-action)
* [Boosting Upward Mobility: Metrics to Inform Local Action Summary](https://www.urban.org/research/publication/boosting-upward-mobility-metrics-inform-local-action-summary)

### Technical Background

* [R Markdown](https://rmarkdown.rstudio.com/). 
* [Iterated fact sheets with R Markdown](https://medium.com/@urban_institute/iterated-fact-sheets-with-r-markdown-d685eb4eafce) and * [Iterated PDFs with R Markdown](https://medium.com/@urban_institute/iterated-pdfs-with-r-markdown-144e2a6d6a1a).

## Getting started

### R Setup

This code works successfully on `R 3.6.0` and `RStudio 1.3.1093`. Consider updating if you are on older versions of the software and are experiencing issues. 

### Lato font

The Urban Institute uses the font [Lato](https://fonts.google.com/specimen/Lato). Go to `Control Panel` > `Appearance and Personalization` > `Fonts` to see if Lato is installed on your computer. Contact the IT Helpdesk if Lato isn't installed on your computer. 

## Iteration

1. Clone the repository on to your local machine with `git clone https://github.com/UI-Research/gates-mobility-metrics-pages.git`.
2. Create a new branch called `<your-name>` with `git checkout -b <your-name>`.
3. If you had previously completed steps 1 and 2, then confirm you are on the correct branch with `git branch` and run `git pull origin master` to update your local branches with remote changes. 
4. Create a .csv with the name `##_name.csv` (e.g. `01_rfi-applicants.csv`) in the data folder. The file should contain:
    * `state` The state name.
    * `county` The county name. 
    * `fips` [The 5-digit county FIPS code](https://www.nrcs.usda.gov/wps/portal/nrcs/detail/national/home/?cid=nrcs143_013697) for the base county. 
    * `comparisons` 5-digit county FIPS codes separated by semicolons for comparison counties. 
5. Create a new directory in the `factsheets/` directory called `##_name/` (e.g. `01_rfi-applicants/`). Add a `.gitignore` in the new directory with 
```
# Ignore everything in this directory
*
# Except this file
!.gitignore
```
6. Update `create_pages.R`. Add a comment that describes the task and then add `prep_pages()` and `render_pages()`. Run `library(tidyverse)`, `source("R/prep_pages.R")`, and `source("R/render_pages.R")` before running your new lines of code. Don't run other lines of code. 
7. Add, commit, and push your local branch to GitHub with GitHub Bash (your command line tool). 
8. Put in a pull request to the master branch (in the web browser).

## Published Counties

### Beta Cohort

* [Alameda, California](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06001-Alameda-California_598)
* [Riverside, California](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06065-Riverside-California_435)
* [Washington, DC](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/11001-District-of-Columbia-District-of-Columbia_202)
* [St. Lucie, Florida](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/12111-St-Lucie-Florida_499)
* [Ramsey, Minnesota](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/27123-Ramsey-Minnesota_522)
* [Boone, Missouri](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/29019-Boone-Missouri_159)
* [Summit, Ohio](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/39153-County-of-Summit-Ohio-Ohio_279)
* [Philadelphia](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/42101-Philadelphia-Pennsylvania_711)

### NACO

* [Mobile, Alabama](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/01097-Mobile-Alabama_499/)
* [Coconino, Arizona](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/04005-Coconino-Arizona_598/)
* [Santa Cruz, Arizona](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/04023-Santa-Cruz-Arizona_711/)
* [Palm Beach, Florida](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/12099-Palm-Beach-Florida_159/)
* [Pinellas, Florida](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/12103-Pinellas-Florida_279/)
* [Holmes, Mississippi](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/28051-Holmes-Mississippi_435/)
* [Nassau, New York](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/36059-Nassau-New-York_522/)
* [Tarrant, Texas](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/48439-Tarrant-Texas_888/)
* [Mercer, West Virginia](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/54055-Mercer-West-Virginia_202/)
* [Waukesha, Wisconsin](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/55133-Waukesha-Wisconsin_356/)

## Contributors

### Authors

* Vivian Zheng
* Aaron R. Williams
