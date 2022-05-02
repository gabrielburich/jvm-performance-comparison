FROM openjdk:17-jdk-alpine3.14

COPY target/jvm-performance-comparison-0.0.1-SNAPSHOT.jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar

ENTRYPOINT java -jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar