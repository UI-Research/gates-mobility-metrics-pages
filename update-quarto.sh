# Code to update quarto to most recent version and then print that version
sudo curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo apt-get update -y
sudo apt-get install gdebi-core
sudo gdebi quarto-linux-amd64.deb
quarto --version

