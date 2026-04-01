FROM openjdk:8-alpine

#Required for starting application up.

RUN apk update && apk add /bin/sh

Run mkdir -p /opt/app

ENV PROJECT HOME /opt/app

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo", "-jar", "app.jar"]

# Stage 1: Build

# FROM maven:3.9.6-eclipse-temurin-8 AS build
# WORKDIR /build
# COPY pom.xml .
# COPY src ./src
# RUN mvn clean package -DskipTests

# Stage 2: Run the application
# Using Eclipse Temurin OpenJDK 8 image
#FROM eclipse-temurin:8-jdk
#ENV PROJECT_HOME=/opt/app
#WORKDIR $PROJECT_HOME
