# Etapa de construcción
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml . 
COPY src/ src/
RUN mvn -e -X -f pom.xml clean package

# Etapa de ejecución
FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /app/target/Projecto_Invitados-1.0-SNAPSHOT.war app.war

# Descarga webapp-runner (si no lo tienes en tu proyecto)
RUN curl -o webapp-runner.jar -L https://repo1.maven.org/maven2/com/github/jsimone/webapp-runner/9.0.30.0/webapp-runner-9.0.30.0.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "webapp-runner.jar", "--port", "8080", "app.war"]
