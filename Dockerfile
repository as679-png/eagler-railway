FROM eclipse-temurin:21-jre

WORKDIR /app

# Copies ALL folders (bungee, bungeecord, mcserver, plugins) into Docker
COPY . /app

# Automatically accepts Minecraft EULA inside mcserver
RUN mkdir -p /app/mcserver && echo "eula=true" > /app/mcserver/eula.txt

# Expose default Bungee port
EXPOSE 25577

# Starts BungeeCord (256MB RAM cap) then PaperMC (768MB RAM cap)
CMD ["bash", "-c", "cd /app/bungeecord && java -Xms128M -Xmx256M -jar $(ls *.jar | head -n 1) & sleep 6 && cd /app/mcserver && java -Xms256M -Xmx768M -jar $(ls *.jar | head -n 1)"]
