FROM gradle:7.2.0-jdk17 AS build
COPY --chown=gradle:gradle . /home/bestofoleg/java-apps-repo/boohome/
WORKDIR /home/bestofoleg/java-apps-repo/boohome/
RUN ls -a
RUN gradle build --no-daemon

FROM openjdk:17.0.1-jdk-slim

EXPOSE 8080

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]