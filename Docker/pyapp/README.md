# Flask App with Docker

## Overview
This project is a simple **Flask application** that runs inside a **Docker container** using an **Ubuntu 22.04** base image.

## 🛠 Prerequisites
Before running the project, ensure you have:
- **Docker** installed on your machine ([Download Docker](https://www.docker.com/get-started))

## 📦 Building the Docker Image
To build the Docker image, run:
```bash
docker build -t abeerseada/flask-app .
```

## 🚀 Running the Container
To run the container and expose it on **port 3000**, use:
```bash
docker run -d -p 3000:3000 flask-app
```

## 🔄 Stopping the Container
To stop the running container:
```bash
docker ps  # Find the container ID
docker stop <container_id>
```

## 🏗 Pushing to Docker Hub
To push the image to **Docker Hub**:
1. Log in to Docker Hub:
   ```bash
   docker login
   ```
2. Push the image:
   ```bash
   docker push abeerseada/flask-app:latest
   ```

## 🔥 Pulling the Image on Another Machine
To use this image on another machine, simply pull it using:
```bash
docker pull abeerseada/flask-app:latest
```
Then run it:
```bash
docker run -d -p 3000:3000 abeerseada/flask-app
```

## 📝 Project Structure
```
/app
│── app2.py  # Main Flask application
│── Dockerfile  # Docker configuration file
│── README.md  # Project documentation
```

## 📌 Notes
- The **Flask app** is exposed on **port 3000**.
- Ensure Docker is running before executing the commands.

---