FROM flink:latest

# Install JDK and Maven
RUN apt-get update && apt-get install -y openjdk-11-jdk maven

# Set the working directory in the container
WORKDIR /opt/flink

# Copy your Java program and the Maven pom.xml file into the container
COPY /src /opt/flink/src
COPY pom.xml /opt/flink/

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Compile and package the application using Maven
WORKDIR /opt/flink
RUN mvn -f /opt/flink/pom.xml clean package

# Create the directory if it doesn't exist and move the compiled jar to it
RUN mkdir -p /opt/flink/usrlib && mv target/flink-test-*.jar /opt/flink/usrlib/flink-test.jar
