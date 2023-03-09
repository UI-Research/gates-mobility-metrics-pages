## Factsheets pages organization and notes

Urban Institute data scientists Aaron Williams and Gabe Morrison are producing around 3500 city and county mobility metrics data pages. 
Urban Institute data engineer Erika Tyagi is assisting with AWS management and organization. 

If you have questions, please reach out to gmorrison@urban.org, awilliams@urban.org, and/or etyagi@urban.org.

### Organization:

These data pages are stored the `factsheets` sub-directory of the gates-mobility-metrics-pages 
github repository. Within `factsheets`, we have folder organization of the form:
`YYYYY/index.html` where `YYYYY` is a five- or six-digit fips code. 
One currently operational factsheet can be found at: 
`06041/index.html`

We use code to upload from the `factsheets/` directory to the s3 bucket. 

Note that for each factsheet, we have a data page (`index.html`) and a description page 
(`description.html`).

We currently have uploaded factsheets from 5 directories, but, as noted above, there will ultimately be 
around 3500. If need be, Gabe can create more sample fact sheets. 

### Problems/Outstanding Questions:

2. We have many description pages even though they are all the identical. This seems inelegant but may be totally fine. 