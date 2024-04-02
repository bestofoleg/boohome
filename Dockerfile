FROM gradle:7.2.0-jdk17 AS build
COPY . ./boohome
RUN chmod 777 ./boohome
WORKDIR ./boohome
RUN gradle build

FROM openjdk:17.0.1-jdk-slim
ENV JAR_NAME=boohome-0.0.1-SNAPSHOT.jar
ENV APP_HOME=/boohome
WORKDIR $APP_HOME
COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$JAR_NAME