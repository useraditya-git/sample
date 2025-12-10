FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Skip failing tests
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /app

COPY --from=build /app/target /app/target

EXPOSE 8080
CMD ["java", "-jar", "/app/target/dependency/jetty-runner.jar", "--port", "8080", "/app/target/*.war"]
