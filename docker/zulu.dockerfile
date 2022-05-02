FROM mcr.microsoft.com/java/jdk:11-zulu-alpine

COPY target/jvm-performance-comparison-0.0.1-SNAPSHOT.jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar

ENTRYPOINT java -jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar