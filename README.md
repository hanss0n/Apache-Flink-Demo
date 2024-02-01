# Apache Flink Demo Docker Setup

This guide provides instructions on how to set up and run an Apache Flink application using Docker. This setup is ideal for development, testing, and experimentation with Flink in a containerized environment.

## Prerequisites

- **Docker Desktop**: Ensure you have Docker Desktop installed on your machine. It's available for Windows, Mac, and Linux. You can download it from [Docker's official website](https://www.docker.com/products/docker-desktop).

## Getting Started

### Step 1: Clone the Repository

First, clone the repository containing the Docker setup and Flink application. If the repository is not available, you can create the necessary files (`Dockerfile`, `docker-compose.yml`, Java source files, and `pom.xml`) based on the structure described in this guide.

```bash
git clone https://github.com/hanss0n/Apache-Flink-Demo
cd Apache-Flink-Demo
```

### Step 2: Build the Docker Image

Navigate to the directory containing the Dockerfile and build the Docker image. This process involves downloading the base image, installing necessary dependencies, and compiling your Flink application.

```bash
docker compose build
```

### Step 3: Start the Flink Cluster

Run the following command to start the Flink cluster. This command starts the necessary Docker containers for the Flink JobManager and TaskManagers.

```bash
docker compose up -d
```

### Step 4: Access the Flink Dashboard

You can access the Flink Web UI to monitor the cluster and jobs. Open your web browser and navigate to:

```
http://localhost:8081
```

### Step 5: Submitting a Flink Job

To submit a job to the Flink cluster:

1. Retrieve the jobmanager container name:
   ```bash
   docker ps -f "name=flink_test-jobmanager" --format "{{.ID}}"
   ```

   Access the JobManager container's shell:

   ```bash
   docker exec -it [jobmanager-container-name] /bin/bash
   ```

   Replace `[jobmanager-container-name]` with the name of your JobManager container.

2. Run the following command to submit the Flink job:

   ```bash
   ./bin/flink run /opt/flink/usrlib/flink-test.jar
   ```


