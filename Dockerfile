# Bước 1: Build ứng dụng Spring Boot WAR bằng Maven và Java 17
FROM maven:3.8.4-openjdk-17 AS build

# Copy source code và pom.xml vào container
COPY src /thecode/spring-mvc/src
COPY pom.xml /thecode/spring-mvc

WORKDIR /thecode/spring-mvc

# Build ứng dụng, bỏ qua test để tăng tốc
RUN mvn clean package -DskipTests

# Bước 2: Chạy ứng dụng bằng OpenJDK 17
FROM openjdk:17-slim

# Copy file WAR từ bước build vào thư mục chạy ứng dụng
COPY --from=build /thecode/spring-mvc/target/*.war /thecode/spring-mvc/app.war

WORKDIR /app

# Mở cổng 8080
EXPOSE 8080

# Chạy ứng dụng WAR bằng Spring Boot
ENTRYPOINT ["java", "-jar", "/thecode/spring-mvc/app.war"]
