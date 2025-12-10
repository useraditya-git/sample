FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy everything built, not just jar
COPY --from=build /app/target /app/target

EXPOSE 8080

CMD ["java", "-jar", "/app/target/dependency/jetty-runner.jar", "--port", "8080", "/app/target/*.war"]
