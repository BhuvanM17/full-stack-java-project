# Build stage
FROM maven:3.9.6-eclipse-temurin-11 AS build
WORKDIR /app

# Copy the pom.xml and src from the medi_sales directory
COPY medi_sales/pom.xml .
COPY medi_sales/src ./src

# Build the project
RUN mvn clean package -DskipTests

# Run stage
FROM tomcat:9.0-jdk11-openjdk-slim
# The war file is built inside the WORKDIR/target
COPY --from=build /app/target/medi_sales.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
