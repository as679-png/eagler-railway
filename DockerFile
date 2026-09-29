FROM eclipse-temurin:21-jre

WORKDIR /app

# Download Paper 1.20.4 automatically during the build process
RUN apt-get update && apt-get install -y curl && \
    curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/496/downloads/paper-1.20.4-496.jar

COPY . /app

EXPOSE 8080

CMD ["java", "-Xmx1024M", "-Xms512M", "-jar", "paper.jar", "nogui"]
