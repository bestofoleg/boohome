FROM gradle:7.2.0-jdk17 AS build
WORKDIR /usr/app/
COPY . .
RUN gradle build

FROM openjdk:17.0.1-jdk-slim
ENV JAR_NAME=app.jar
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$JAR_NAME