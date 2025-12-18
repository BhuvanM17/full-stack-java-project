#!/bin/bash

echo "Starting build process for MediSales..."

# Check if Maven is installed
if ! command -v mvn &> /dev/null
then
    echo "Maven could not be found. Please install Maven."
    exit
fi

# Build the project
mvn clean package

echo "Build successful! Your WAR file is at target/medi_sales.war"
echo "You can deploy this to Tomcat, Heroku, Render, or any other Java-supported platform."
echo "For easy deployment, use 'docker build -t medisales ./deploy && docker run -p 8080:8080 medisales'"
