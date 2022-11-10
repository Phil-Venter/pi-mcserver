# Raspberry PI 3 Minecraft Server setup script
A simple script that sets up a Raspberry PI 3 for Minecraft server hosting

## Running script
### Un-attended

```bash
curl -s https://raw.githubusercontent.com/Phil-Venter/pi-mcserver/main/install.sh | bash
```

**Default Settings**

- **Server** [Purpur](https://purpurmc.org/)
- **Minecraft Version** 1.19.2
- **Server install location** /home/pi/mcserver
- **Initial RAM to be used by Java** 768MB
- **Max RAM to be used by Java** 1GB
- **Linux Page swap size** 2GB

### Attended

If you do not like any of the defaults, this is probably the route to go
```bash
curl -s https://raw.githubusercontent.com/Phil-Venter/pi-mcserver/main/install.sh
chmod a+x install.sh
nano install.sh
```
**Update the defaults you do not like**

- MINECRAFT_VERSION: Minecraft version to install
- SERVER_LOCATION: where the server will be installed
- SERVER_JAR_URL: URL of the Minecraft Server JAR file (If not using Purpur, unsure you get the correct URL that matches the version you want)
- JAVA_AVG_RAM: Java -Xms property, Starting RAM (in MB) allocated to Java.
- JAVA_MAX_RAM: Java -Xmx property, Maximum RAM (in MB) allocated to Java.
- SWAP_SIZE: Linux page SWAP size (in MB), default PI installaction allocates 100MB

```bash
./install.sh
```
