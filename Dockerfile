FROM openjdk:17.0.2-jdk-slim-buster
ARG JAR_FILE=build/lib/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/boohome-0.0.1-SNAPSHOT.jar.jar"]