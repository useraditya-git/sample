# Use OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy jar file from target folder
COPY target/*.jar app.jar

# Expose port used by app
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","app.jar"]
