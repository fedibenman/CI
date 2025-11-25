# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Optional: set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot jar into the container
COPY target/*.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]

