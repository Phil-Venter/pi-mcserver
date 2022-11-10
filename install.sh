MINECRAFT_VERSION=1.19.2
SERVER_LOCATION=/home/pi/mcserver
SERVER_JAR_URL=https://api.purpurmc.org/v2/purpur/${MINECRAFT_VERSION}/latest/download
JAVA_AVG_RAM=768
JAVA_MAX_RAM=1024
SWAP_SIZE=1820

# UPDATE PI
sudo apt update
sudo apt upgrade -y
sudo apt install -y openjdk-17-jre

# MINECRAFT
mkdir -p "${SERVER_LOCATION}"
cd "${SERVER_LOCATION}"
curl -s "${SERVER_JAR_URL}" --output server.jar

## INITIAL RUN AND ACCEPT EULA
java -Xms${JAVA_AVG_RAM}M -Xmx${JAVA_MAX_RAM}M -jar server.jar
sed -i "s|eula=false|eula=true|g" eula.txt

## SETUP STARTUP SCRIPT
cat << DATA > run.sh
#!/bin/bash
cd ${SERVER_LOCATION}
while true
do
   java -Xms${JAVA_AVG_RAM}M -Xmx${JAVA_MAX_RAM}M -jar server.jar --nogui >> output.\$(date +%Y%m%d).txt
   sleep 10
done
DATA
chmod a+x run.sh
(crontab -u pi -l; echo "@reboot ${SERVER_LOCATION}/run.sh" ) | crontab -u pi -

# INCREASE SWAP
sudo dphys-swapfile swapoff
sudo sed -i "s|CONF_SWAPSIZE=100|CONF_SWAPSIZE=${SWAP_SIZE}|g" /etc/dphys-swapfile
sudo dphys-swapfile swapon

sudo reboot
