#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
sudo apt-get install libjpeg-dev

#needed by the velocity R package 
#sudo apt-get install -y libboost-dev 
#sudo apt-get install -y libboost-all-dev
## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/BiocAsia2023 /home/gittmp/

## wget all data files from Google Cloud Storage into /home/CPC/
cd /home/gittmp
wget -O data.zip "https://www.dropbox.com/scl/fi/vh6zspd3xp9p7ih6rgnz8/data.zip?rlkey=5abvspvoeix1s00md69t2v53f&dl=0"
unzip data.zip

ls /home/
ls /home/gittmp/
  
## Set up users
  
sudo groupadd trainees

for((userIndex = 1; userIndex <= 50; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  # sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2023 | sudo chpasswd
}
done
