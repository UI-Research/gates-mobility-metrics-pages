# Gates Mobility Metrics Pages

## Overview

This repository contains tools and templates for creating Urban Institute-styled, html fact pages in [R Markdown](https://rmarkdown.rstudio.com/). For more information, read [Iterated fact sheets with R Markdown](https://medium.com/@urban_institute/iterated-fact-sheets-with-r-markdown-d685eb4eafce) and [Iterated PDFs with R Markdown](https://medium.com/@urban_institute/iterated-pdfs-with-r-markdown-144e2a6d6a1a).

## Getting started

### Lato font

The Urban Institute uses the font [Lato](https://fonts.google.com/specimen/Lato). Go to `Control Panel` > `Appearance and Personalization` > `Fonts` to see if Lato is installed on your computer. Contact the IT Helpdesk if Lato isn't installed on your computer. 

Fonts are embedded in the PDFs with the [Cairo graphics library](https://www.cairographics.org/). Cairo is installed when R is installed. On Macs, Cairo won't work unless [XQuartz](https://www.xquartz.org/) is installed. 

### Download this repository

Download the contents of this repository to get access to the template. Using [R Projects](https://ui-research.github.io/r-at-urban/intro-to-r.html#projects) with the template is highly recommended and an R Project is included in the repository.  

## Use

`template.Rmd` contain settings and code to put R Markdown PDFs into the Urban Institute fact page style. Many of the changes are automated. 

## General guidelines

* No text smaller than 9 point.
* All headings and body text (including bullets, table text, etc.) should be flush left.
* First-level headings should be the second-most-prominent text on the page and should include a visual break (i.e., blank space). 12 pt Lato, bold, 12 points of space before the paragraph.
* Titles, subtitles, and author names should be centered at the top of page one.
* The title should be the most prominent text on page 1. Titles should be 15 pt Lato, bold, black.
* Subtitles should be 12 pt Lato, regular, Urban blue.
* Author name(s) should appear on page 1 under the title (and subtitle, if applicable). Author name(s) should be 11 pt Lato, italic, black, 12 points of space after the paragraph.
* Make heavy use of the [Urban Institute Data Visualization Style Guide](http://urbaninstitute.github.io/graphics-styleguide/)

## Iteration

1. Clone the repository on to your local machine with `git clone https://github.com/UI-Research/gates-mobility-metrics-pages.git`.
2. Create a new branch called `<your-name>` with `git checkout -b <your-name>`.
3. If you had previously completed steps 1 and 2, then run `git pull origin master` to update your local branches with remote changes. 
4. Create a .csv with the name `##_name.csv` (e.g. `01_rfi-applicants.csv`) in the data folder. The file should contain:
    * `state` The state name.
    * `county` The county name. 
    * `fips` [The 5-digit county FIPS code](https://www.nrcs.usda.gov/wps/portal/nrcs/detail/national/home/?cid=nrcs143_013697) for the base county. 
    * `comparisons` 5-digit county FIPS codes separated by semicolons for comparison counties. 
5. Create a new directory in the `factsheets/` directory called ``##_name/` (e.g. `01_rfi-applicants/`). Add a `.gitignore` in the new directory with 
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
