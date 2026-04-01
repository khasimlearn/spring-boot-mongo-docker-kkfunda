FROM eclipse-temurin:8-jdk-alpine

# Create app directory
RUN mkdir -p /opt/app

# Set working directory
WORKDIR /opt/app

# Copy jar file
COPY target/spring-boot-mongo-1.0.jar app.jar

# Expose port
EXPOSE 8080

# Run application
CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo", "-jar", "app.jar"]
