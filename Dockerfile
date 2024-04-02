FROM gradle:7.2.0-jdk17 AS build
COPY . ./app
WORKDIR ./app
RUN echo $(ls -1)
RUN gradle build || return 1

FROM openjdk:17.0.1-jdk-slim
ENV JAR_NAME=boohome-0.0.1-SNAPSHOT.jar
ENV APP_HOME=./boohome
WORKDIR $APP_HOME
COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$JAR_NAME