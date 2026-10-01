FROM eclipse-temurin:21-jre

WORKDIR /app
COPY . /app

RUN mkdir -p /app/mcserver && echo "eula=true" > /app/mcserver/eula.txt

EXPOSE 25577

CMD ["bash", "-c", "cd /app/mcserver && java -Xms256M -Xmx512M -XX:+UseG1GC -jar $(ls *.jar | head -n 1) & sleep 15 && cd /app/bungeecord && java -Xms64M -Xmx128M -jar $(ls *.jar | head -n 1)"]
