FROM openjdk:11.0.7-jre-slim

COPY target/serviceB*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]