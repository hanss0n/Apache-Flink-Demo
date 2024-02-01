# Flink Dockerized Environment

This repository contains a Dockerized Apache Flink environment for easy development and deployment of Flink jobs. It includes Docker Compose configurations for setting up a Flink cluster and a development environment where you can compile and run Flink jobs.

## Getting Started

### Prerequisites

- Docker
- Docker Compose

### Building the Environment

To build the Docker images for the Flink cluster and set up the environment, run the following command:

```sh
docker-compose build
```

### Starting the Services

To start the Flink cluster in detached mode, use the following command:

```sh
docker-compose up -d
```

This will start the services defined in `docker-compose.yml`, including the Flink JobManager and TaskManagers.

### Accessing the JobManager Shell

To access the shell of the JobManager container, use the following command:

```sh
docker-compose exec jobmanager /bin/bash
```

This will give you a bash shell inside the `jobmanager` service container.

### Accessing the Flink Dashboard

The Flink Dashboard is accessible through your web browser. Once the services are up, you can visit:

```
http://localhost:8081
```

This will bring up the Flink Dashboard where you can monitor and control your Flink jobs.

### Running a Flink Job

To run a Flink job, such as the WordCount example, you can use the following command structure:

```sh
flink run -c com.example.WordCount /target/original-flink-test-1.0-SNAPSHOT.jar
```

### Development Workflow

The repository is mounted within the JobManager service, allowing you to edit the code outside Docker on your host machine. After editing, you can compile the code inside the `jobmanager` container using Maven:

```sh
mvn clean package
```

This will compile your Flink job and create the necessary JAR file to be submitted to the Flink cluster.

## Contributing

Feel free to fork this repository and submit pull requests with enhancements or fixes.

