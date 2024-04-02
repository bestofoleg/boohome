FROM gradle:7.2.0-jdk17 AS build
ADD .
COPY --chown=gradle:gradle . /home/gradle
WORKDIR /home/gradle
RUN gradle build || return 1

FROM openjdk:17.0.1-jdk-slim
ENV JAR_NAME=boohome-0.0.1-SNAPSHOT.jar
ENV APP_HOME=/home/gradle
WORKDIR $APP_HOME
COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$JAR_NAME