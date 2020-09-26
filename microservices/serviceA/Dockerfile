FROM openjdk:11.0.7-jre-slim

COPY target/serviceA*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]