## Steps to Run the Fact Sheet Code
### Gabe Morrison
### 2023-07-10

#### Step 1: Spin up a large EC2 instance using the elastic analytics Launch template:
 - Option 1:
     - If you have sufficient AWS permissions, you can do this from the EC2 Console. Go to AWS Console > EC2 page > Launch Template > Choose Elastic Analytics Template and choose a large EC2 instance
     - Gabe recommends c6a.32xlarge if available and another member of the c6a.xlarge family if not.  
     - Note that you may not have credentials to  do this and may need to reach out to the AWS Goverance team for assistance (use the ec2 intake form: https://app.smartsheet.com/b/form/2c9200302b9941cebc0b61e945653f48)
 - Option 2:
     - Spin up a big EC2 instance with TechTools.  
 - Note: This step may not be necessary if an instance has already been spun up and is currently "off". If this is the case, instead of taking the actions above, you will need to (1) ssh into the instance and (2) rerun the rocker docker image. More guidance on how to do this can be found on the AWS Governance Confluence page. 

##### Step 2 Connect to the EC2 instance. You can only connect to an RStudio GUI running on the instance from a remote desktop so you should:
  - Go to Urban Users (or another remote desktop)
  - Go to the link that is sent to you in the email by etyagi@urban.org. The link is also http://ec2-[IPV4 address separated by hypens. Ex: 001-002-003-004].compute-1.amazonaws.com:8787
  - Log in using the TechTools credentials. Reach out to an AWS Governance member for questions. 
  
#### Step 3: Clone the pages repo:
  - Run `git clone https://github.com/UI-Research/gates-mobility-metrics-pages` in the terminal
  - Depending on the status of the repo, you may need to checkout the most updated branch with:
    - `cd gates-mobility-metrics-pages`
    - `git checkout -b [branch name]` 
    - `git config --global user.email [your email]`
    - `git config --global user.name [Your name]`
    - `git pull origin [branch name]`
  - You may have to resolve merge conflicts:
    - `git add -u`
    - `git commit -m "updating local branch with remote of issXXX"`

#### Step 4: Run the `update-quarto.sh` script:
  - Gabe finds that this works most successfully if you run this line by line
  - Note that you will need to enter `Y` and `y` to the prompts in the terminal
  - You should restart R after doing this. Go Session > Quit Session. Then Click Open New Session 

#### Step 5: Open the `/gates-mobility-metrics-pages/` R project 
    - Gabe uses the file directory in the bottom right of RStudio
    - Run the `R/startup.R` script. Again, for whatever reason, Gabe finds this works only if you run the code line-by-line. 
    
#### Step 6: Run the commented out test-code in `create_standard_pages.R`. This should create 4 pages for each of the cities and counties. 
    - A common error in this workflow is:
    `Quitting from lines 172-1 (index-county.qmd) Error: ! The inline value cannot be coerced to character: title`
    - This comes from quarto and the packages not being updated. Ensure you restart R and have all packages installed. With this in place, Gabe finds the code runs successfully. 
    
#### Step 7: Once the small tests work successfully, you can run the code under "#For actual run". This process takes about 1 - 1.5 hours. 
  - If you use an instance other than the c6a.32xlarge you will need to change to the NCORES value based on that instance. Note that RStudio cannot handle more than 125 simultaneous connections, so it is likely not beneficial to scale up larger than that instance. 
