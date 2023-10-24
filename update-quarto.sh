# Code to update quarto to most recent version and then print that version. Then it installs aws cli.
sudo curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo apt-get update -y
sudo apt-get install gdebi-core
sudo gdebi quarto-linux-amd64.deb
quarto --version


curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

