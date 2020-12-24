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

## Contributors

### Authors

* Vivian Zheng
* Aaron R. Williams
