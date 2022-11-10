# Raspberry PI 3 Minecraft Server setup script
A simple script that sets up a Raspberry PI 3 for Minecraft server hosting

## Running script
### Un-attended

**Settings**

- **Server install location** /home/pi/mcserver
- **Server jar to use** https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/265/downloads/paper-1.19.2-265.jar
- **Initial RAM to be used by Java** 768MB
- **Max RAM to be used by Java** 1GB
- **Linux Page swap size** 2GB

`curl -s https://raw.githubusercontent.com/Phil-Venter/pi-mcserver/main/install.sh | bash`
