# Stage 1: Build
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM tomcat:9.0-jdk11-openjdk-slim
COPY --from=build /app/target/SecureSteganography.war /usr/local/tomcat/webapps/ROOT.war

# Port adjustment for Railway
EXPOSE 8080
CMD ["sh", "-c", "sed -i 's/8080/'${PORT:-8080}'/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
