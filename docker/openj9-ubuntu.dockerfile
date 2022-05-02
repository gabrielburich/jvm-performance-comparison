FROM adoptopenjdk/openjdk16-openj9:x86_64-ubuntu-jre16u-nightly

COPY target/jvm-performance-comparison-0.0.1-SNAPSHOT.jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar

ENTRYPOINT java -jar /opt/app/jvm-performance-comparison-0.0.1-SNAPSHOT.jar