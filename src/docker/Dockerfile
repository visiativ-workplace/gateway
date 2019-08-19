FROM openjdk:11-slim

ARG JAR_NAME

ADD app.jar app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]