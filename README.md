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
3. If you had previously completed steps 1 and 2, then confirm you are on the correct branch with `git branch` and run `git pull origin master` to update your local branche with remote changes. 
4. Create a .csv with the name `##_name.csv` (e.g. `01_rfi-applicants.csv`) in the data folder. The file should contain:
    * `state` The state name.
    * `county` The county name. 
    * `fips` [The 5-digit county FIPS code](https://www.nrcs.usda.gov/wps/portal/nrcs/detail/national/home/?cid=nrcs143_013697) for the base county. 
    * `comparisons` 5-digit county FIPS codes separated by semicolons for comparison counties. 
    * `random_id` A 3-digit random ID.  
5. Update `create_pages.R`. Add a comment that describes the task and then add `prep_pages()` and `render_pages()`. Run `library(tidyverse)`, `source("R/prep_pages.R")`, and `source("R/render_pages.R")` before running your new lines of code. Don't run other lines of code. 
6. Add the new URLs to the README under a section for the request. 
7. Add, commit, and push your local branch to GitHub with GitHub Bash (your command line tool). 
8. Put in a pull request to the master branch (in the web browser).

## Published Counties

### Beta Cohort

* Alameda, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06001-Alameda-California_598), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/06001-Alameda-California_598))
* Alameda, California Neighbors 1 ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06001-Alameda-Neighbors-1-California_942), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/06001-Alameda-Neighbors-1-California_942))
* Alameda, California Neighbors 2 ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06001-Alameda-Neighbors-2-California_683), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/06001-Alameda-Neighbors-2-California_683))
* Riverside, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/06065-Riverside-California_435), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/06065-Riverside-California_435))
* Washington, DC ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/11001-District-of-Columbia-District-of-Columbia_202), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/11001-District-of-Columbia-District-of-Columbia_202))
* St. Lucie, Florida ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/12111-St-Lucie-Florida_499), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/12111-St-Lucie-Florida_499))
* Ramsey, Minnesota ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/27123-Ramsey-Minnesota_522), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/27123-Ramsey-Minnesota_522))
* Ramsey, Minnesota 2 ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/27123-Ramsey-Minnesota_523), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/27123-Ramsey-Minnesota_523))
* Boone, Missouri ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/29019-Boone-Missouri_159), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/29019-Boone-Missouri_159))
* Summit, Ohio ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/39153-County-of-Summit-Ohio-Ohio_279), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/39153-County-of-Summit-Ohio-Ohio_279))
* Philadelphia, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/05_rfi-finalists/42101-Philadelphia-Pennsylvania_711), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/09_rfi-finalists-viz/42101-Philadelphia-Pennsylvania_711))

### NACO

* [Mobile, Alabama](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/01097-Mobile-Alabama_499/)
* [Coconino, Arizona](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/04005-Coconino-Arizona_598/)
* [Santa Cruz, Arizona](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/04023-Santa-Cruz-Arizona_711/)
* [Palm Beach, Florida](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/12099-Palm-Beach-Florida_159/)
* [Pinellas, Florida](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/12103-Pinellas-Florida_279/)
* [Holmes, Mississippi](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/28051-Holmes-Mississippi_435/)
* [Nassau, New York](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/36059-Nassau-New-York_522/)
* [Franklin, Ohio](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/39049-Franklin-Ohio_464/)
* [Multnomah, Oregon](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/41051-Multnomah-Oregon_379/)
* [Erie, Pennsylvania](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/42049-Erie-Pennsylvania_654/)
* [Tarrant, Texas](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/48439-Tarrant-Texas_888/)
* [Mercer, West Virginia](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/54055-Mercer-West-Virginia_202/)
* [Waukesha, Wisconsin](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/06_naco/55133-Waukesha-Wisconsin_356/)

### CFON

* [California](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/06081-San-Mateo-California_202/)
* [Connecticut](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/09003-Hartford-Connecticut_279/)
* [Hawaii](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/15001-Hawaii-Hawaii_499/)
* [Indiana](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/18097-Marion-Indiana_598/)
* [Nebraska](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/31109-Lancaster-Nebraska_522/)
* [Ohio](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/39035-Cuyahoga-Ohio_435/)
* [Washington](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/07_cfon/53033-King-Washington_159/)

### CFLeads

* [Community Foundation for Greater Buffalo](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/11_cfleads/36029-Erie-Community-Foundation-for-Greater-Buffalo_102/)
* [Greater Cincinnati Foundation](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/11_cfleads/39061-Hamilton-Greater-Cincinnati-Foundation_573/)
* Southwest Initiative Foundation ([Page 1](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/11_cfleads/27011-Big-Stone-Southwest-Initiative-Foundation-1_821/), [Page 2](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/11_cfleads/27085-McLeod-Southwest-Initiative-Foundation-2_908/), [Page 3](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/11_cfleads/27151-Swift-Southwest-Initiative-Foundation-3_762/))

## Hampton, Virginia

* [Hampton, Virginia](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/12_hampton-virginia/51650-Hampton-Virginia_909/)

## Cook County, Illinois

* [Cook County, Illinois](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/13_cook-illinois/17031-Cook-Illinois_757/)

### Beta Cohort (slim)

* Alameda, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/06001-Alameda-California_1), Viz Page)
* Riverside, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/06065-Riverside-California_1), Viz Page)
* Washington, DC ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/11001-District-of-Columbia-District-of-Columbia_1), Viz Page)
* St. Lucie, Florida ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/12111-St-Lucie-Florida_1), Viz Page)
* Ramsey, Minnesota ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/27123-Ramsey-Minnesota_1), Viz Page)
* Boone, Missouri ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/29019-Boone-Missouri_1), Viz Page)
* Summit, Ohio ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/39153-County-of-Summit-Ohio-Ohio_1), Viz Page)
* Philadelphia, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/14_rfi-finalists-slim/42101-Philadelphia-Pennsylvania_1), Viz Page)

### Tennessee Counties 

* Tennessee Counties ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/15_tennessee-counties/47157-Shelby-Tennessee_800), [Viz Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/16_tennessee-counties-viz/47157-Shelby-Tennessee_800))

### Texas Example

* Harris County, Texas ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/17_texas-example/48201-Harris-Texas_911), Viz Page)

### LATimes

* Los Angeles, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/18_latimes/06037-Los-Angeles-California_401), Viz Page)

### Rochester

* Monroe, New York ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/19_rochester/36055-Monroe-New-York_899), Viz Page)

### Dubuque, Iowa

* Dubuque, Iowa ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/20_dubuque/19061-Dubuque-Iowa_866), Viz Page)

### NACO Part 2

* Richmond City, Virginia ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/51760-Richmond-City-Virginia_476), Viz Page)

* Cochise County, Arizona ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/04003-Cochise-Arizona_535), Viz Page)

* Washington County, Arkansas ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/05143-Washington-Arkansas_904), Viz Page)

* Butte County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/06007-Butte-California_123), Viz Page)

* Lake County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/06033-Lake-California_NA), Viz Page)

* Mariposa County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/06043-Mariposa-California_239), Viz Page)

* San Diego County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/06073-San-Diego-California_902), Viz Page)

* Yuba County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/06115-Yuba-California_519), Viz Page)

* Adams County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08001-Adams-Colorado_512), Viz Page)

* Broomfield County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08014-Broomfield-Colorado_778), Viz Page)

* Eagle County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08037-Eagle-Colorado_439), Viz Page)

* Jefferson County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08059-Jefferson-Colorado_222), Viz Page)

* Larimer County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08069-Larimer-Colorado_770), Viz Page)

* Summit County, Colorado ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/08117-Summit-Colorado_406), Viz Page)

* Gadsden County, Florida ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/12039-Gadsden-Florida_829), Viz Page)

* Miami-Dade County, Florida ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/12086-Miami-Dade-Florida_117), Viz Page)

* Palm Beach County, Florida ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/12099-Palm-Beach-Florida_608), Viz Page)

* Cobb County, Georgia ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/13067-Cobb-Georgia_285), Viz Page)

* Newton County, Georgia ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/13217-Newton-Georgia_NA), Viz Page)

* Rockdale County, Georgia ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/13247-Rockdale-Georgia_107), Viz Page)

* Honolulu County, Hawaii ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/15003-Honolulu-Hawaii_NA), Viz Page)

* Kauai County, Hawaii ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/15007-Kauai-Hawaii_503), Viz Page)

* Maui County, Hawaii ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/15009-Maui-Hawaii_531), Viz Page)

* Cook County, Illinois ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/17031-Cook-Illinois_791), Viz Page)

* Johnson County, Iowa ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/19103-Johnson-Iowa_165), Viz Page)

* Baltimore County, Maryland ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/24005-Baltimore-Maryland_398), Viz Page)

* Gogebic County, Michigan ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/26053-Gogebic-Michigan_267), Viz Page)

* Oakland County, Michigan ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/26125-Oakland-Michigan_994), Viz Page)

* Rice County, Minnesota ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/27131-Rice-Minnesota_085), Viz Page)

* Lowndes County, Mississippi ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/28087-Lowndes-Mississippi_NA), Viz Page)

* Audrain County, Missouri ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/29007-Audrain-Missouri_NA), Viz Page)

* Taos County, New Mexico ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/35055-Taos-New-Mexico_701), Viz Page)

* Buncombe County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37021-Buncombe-North-Carolina_393), Viz Page)

* Durham County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37063-Durham-North-Carolina_603), Viz Page)

* Guilford County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37081-Guilford-North-Carolina_837), Viz Page)

* Mecklenburg County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37119-Mecklenburg-North-Carolina_455), Viz Page)

* Pitt County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37147-Pitt-North-Carolina_NA), Viz Page)

* Warren County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37185-Warren-North-Carolina_738), Viz Page)

* Wilkes County, North Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/37193-Wilkes-North-Carolina_445), Viz Page)

* McKenzie County, North Dakota ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/38053-McKenzie-North-Dakota_441), Viz Page)

* Franklin County, Ohio ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/39049-Franklin-Ohio_415), Viz Page)

* Montgomery County, Ohio ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/39113-Montgomery-Ohio_NA), Viz Page)

* Clackamas County, Ohio ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/41005-Clackamas-Oregon_NA), Viz Page)

* Lane County, Oregon ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/41039-Lane-Oregon_707), Viz Page)

* Wasco County, Oregon ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/41065-Wasco-Oregon_808), Viz Page)

* Berks County, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/42011-Berks-Pennsylvania_311), Viz Page)

* Erie County, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/42049-Erie-Pennsylvania_586), Viz Page)

* Lackawanna County, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/42069-Lackawanna-Pennsylvania_892), Viz Page)

* Mercer County, Pennsylvania ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/42085-Mercer-Pennsylvania_284), Viz Page)

* Bamberg County, South Carolina ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/45009-Bamberg-South-Carolina_646), Viz Page)

* Dallas County, Texas ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/48113-Dallas-Texas_789), Viz Page)

* Harris County, Texas ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/48201-Harris-Texas_112), Viz Page)

* Dane County, Wisconsin ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/55025-Dane-Wisconsin_623), Viz Page)

* Sheboygan County, Wisconsin ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/21_naco/55117-Sheboygan-Wisconsin_416), Viz Page)

### Santa Clara County, CA

* Santa Clara County, California ([Data Page](https://ui-research.github.io/gates-mobility-metrics-pages/factsheets/22_santa_clara/06085-Santa-Clara-California_119), Viz Page)



## Contributors

### Authors

* Vivian Zheng
* Aaron R. Williams

