# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-8 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application
# Changed from alpine to slim
FROM openjdk:8-jdk-slim
ENV PROJECT_HOME=/opt/app
WORKDIR $PROJECT_HOME
COPY --from=build /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
