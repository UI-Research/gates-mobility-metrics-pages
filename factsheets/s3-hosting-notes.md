## Factsheets pages organization and notes

Urban Institute data scientists Aaron Williams and Gabe Morrison are producing around 3500 city and county mobility metrics data pages. 
Urban Institute data engineer Erika Tyagi is assisting with AWS management and organization. 

If you have questions, please reach out to gmorrison@urban.org, awilliams@urban.org, and/or etyagi@urban.org.

### Organization:

These data pages are stored the `factsheets` sub-directory of the gates-mobility-metrics-pages 
github repository. Within `factsheets`, we have two layers of folder organization of the form:
`XX_description/YYYYY_region/index.html` where `XX` is a two digit number and `YYYYY` is a five
digit fips code. One currently operational factsheet can be found at: 
`01_rfi-applicants/39113-Montgomery-Ohio/index.html`

We use code to upload from the `factsheets/` directory to the s3 bucket. 

Note that for each factsheet, we have a data page (`index.html`) and a description page 
(`description.html`).

We currently have uploaded factsheets from in three larger directories (i.e. from three folders
of the form `XX_description`), but there are a total of 24 currently. If need be, Gabe can
upload all of the factsheets in under a minute. 

### Problems/Outstanding Questions:

2. We have many description pages even though they are all the identical. This seems inelegant but may be totally fine. 