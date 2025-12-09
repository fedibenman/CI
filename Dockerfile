# Use official OpenJDK 17 slim image
FROM openjdk:17-jdk-slim-bullseye

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Optional: build/run commands
# RUN ./gradlew build
# CMD ["java", "-jar", "yourapp.jar"]
