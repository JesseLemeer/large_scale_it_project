FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

RUN apk add --no-cache maven
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/my-project-1.0-SNAPSHOT.jar"]


# FROM docker.io/maven:3-eclipse-temurin-22 AS build

# CMD mkdir /app
# WORKDIR /app

# COPY . /app

# RUN mvn clean package



# FROM docker.io/eclipse-temurin:22-jre

# RUN mkdir /app
# WORKDIR /app

# COPY --from=build /app/target/*.jar /app/app.jar

# EXPOSE 8080

# CMD [ "java", "-jar", "app.jar" ]
