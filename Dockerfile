# Stage 1: Build with Maven
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run with Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim
COPY --from=build /app/target/SecureSteganography.war /usr/local/tomcat/webapps/ROOT.war

# Set upload limits in Tomcat (optional but good practice)
# Tomcat default is 50MB, which matches our app limit.

EXPOSE 8080
CMD ["catalina.sh", "run"]
