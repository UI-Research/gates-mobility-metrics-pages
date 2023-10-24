#Startup script for Ec2 instances:
install.packages("quarto")
install.packages("tidycensus")
install.packages("tictoc")
install.packages("sf")
install.packages("gtable")
install.packages("here")
install.packages("future")
install.packages("furrr")
install.packages("gt")
install.packages("qdapRegex")

if(!(dir.exists("factsheets/999_county-pages"))){
  dir.create("factsheets/999_county-pages")
} 

if(!(dir.exists("factsheets/998_place-pages"))){
  dir.create("factsheets/998_place-pages")
}
