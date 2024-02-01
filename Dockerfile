FROM flink:latest

# Install JDK and Maven
RUN apt-get update && apt-get install -y openjdk-11-jdk maven

# Environment variable for Java Home
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

WORKDIR /opt/flink/project

