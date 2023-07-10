#Config script


install.packages("tidyverse")
install.packages("here")
install.packages("gt")
install.packages("qdapRegex")
install.packages("tictoc")
install.packages("quarto")
install.packages("tidycensus")
install.packages("future")
install.packages("furrr")
install.packages("aws.s3")

if(!(dir.exists("factsheets/999_county-pages"))){
  dir.create("factsheets/999_county-pages")
} 

if(!(dir.exists("factsheets/998_place-pages"))){
  dir.create("factsheets/998_place-pages")
}
