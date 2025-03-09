FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ src/
RUN mvn -e -X -f pom.xml package

FROM eclipse-temurin:19
WORKDIR /app
COPY --from=build /app/target target
ENTRYPOINT ["java","-jar","target/dependency/webapp-runner.jar","target/Projecto_Invitados-1.0-SNAPSHOT.war"]
#ENTRYPOINT ["ls","-la","target"]