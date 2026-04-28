# Stage 1: Build the WAR
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Configure Tomcat
FROM tomcat:9.0-jdk11-openjdk-slim

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy our WAR
COPY --from=build /app/target/SecureSteganography.war /usr/local/tomcat/webapps/ROOT.war

# Patch server.xml at BUILD TIME to use system property ${port.http}
# This way no runtime sed is needed at all
RUN sed -i 's/port="8080"/port="${port.http}"/g' /usr/local/tomcat/conf/server.xml

# At runtime, Railway provides $PORT env var.
# We pass it as a Java system property so Tomcat picks it up.
CMD ["sh", "-c", "exec env CATALINA_OPTS=\"-Dport.http=${PORT:-8080}\" catalina.sh run"]
