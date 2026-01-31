# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-8 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application
# Using Eclipse Temurin OpenJDK 8 image
FROM eclipse-temurin:8-jdk
ENV PROJECT_HOME=/opt/app
WORKDIR $PROJECT_HOME
