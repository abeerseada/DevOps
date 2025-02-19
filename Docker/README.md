## **🔹 `CMD` vs `ENTRYPOINT` in Docker**
Both **`CMD`** and **`ENTRYPOINT`** define what happens when a Docker container runs, but they have key differences.

---

## **1️⃣ `CMD` (Command)**
🔹 **Purpose**: Defines a **default command** that runs when the container starts.  
🔹 **Can Be Overridden**: When running `docker run`, the command can be changed.

### **Example:**
#### **Dockerfile with `CMD`**
```dockerfile
FROM ubuntu:22.04
CMD ["echo", "Hello from CMD!"]
```
#### **Running the container normally:**
```bash
docker run ubuntu-image
```
🔹 **Output:**
```
Hello from CMD!
```

#### **Overriding the command:**
```bash
docker run ubuntu-image echo "This is overridden"
```
🔹 **Output:**
```
This is overridden
```

📌 **CMD is flexible**—it provides a default but allows overriding.

---

## **2️⃣ `ENTRYPOINT`**
🔹 **Purpose**: Defines a **fixed command** that always runs when the container starts.  
🔹 **Cannot Be Overridden Easily**: Even if you pass a command in `docker run`, `ENTRYPOINT` executes first.

### **Example:**
#### **Dockerfile with `ENTRYPOINT`**
```dockerfile
FROM ubuntu:22.04
ENTRYPOINT ["echo", "Always runs this:"]
```
#### **Running the container normally:**
```bash
docker run ubuntu-image
```
🔹 **Output:**
```
Always runs this:
```

#### **Trying to override with a new command:**
```bash
docker run ubuntu-image "Overriding this"
```
🔹 **Output:**
```
Always runs this: Overriding this
```
Even though we tried to override it, `ENTRYPOINT` **forces its execution**.

📌 **ENTRYPOINT is more rigid**—it enforces execution of a specific command.

---

## **3️⃣ Using `ENTRYPOINT` and `CMD` Together**
You can **combine** both `ENTRYPOINT` and `CMD`.  
🔹 In this case, `CMD` becomes **arguments** for `ENTRYPOINT`.

### **Example:**
#### **Dockerfile with `ENTRYPOINT` and `CMD`**
```dockerfile
FROM ubuntu:22.04
ENTRYPOINT ["echo"]
CMD ["Hello from CMD!"]
```

#### **Running the container normally:**
```bash
docker run ubuntu-image
```
🔹 **Output:**
```
Hello from CMD!
```

#### **Overriding `CMD`:**
```bash
docker run ubuntu-image "Overriding CMD"
```
🔹 **Output:**
```
Overriding CMD
```
✅ **Here, `ENTRYPOINT` (`echo`) stays fixed, while `CMD` provides default arguments.**  
✅ **If you override `CMD`, `ENTRYPOINT` still runs.**

---

## **🎯 Key Differences Between `CMD` and `ENTRYPOINT`**
| Feature            | `CMD` | `ENTRYPOINT` |
|-------------------|--------|-------------|
| Defines a default command? | ✅ Yes | ✅ Yes |
| Can be overridden? | ✅ Yes | ❌ No (unless `--entrypoint` is used) |
| Can accept arguments? | ✅ Yes | ✅ Yes |
| Always runs first? | ❌ No | ✅ Yes |
| Best Use Case | Default commands | Fixed execution logic |

---

## **🚀 When to Use `CMD` vs `ENTRYPOINT`**
| **Use Case** | **CMD** | **ENTRYPOINT** |
|-------------|--------|-------------|
| Run a default command but allow overriding | ✅ Yes | ❌ No |
| Ensure a mandatory script always runs | ❌ No | ✅ Yes |
| Provide default arguments for a command | ✅ Yes | ✅ Yes |
| Example: Running a web server | ✅ `CMD ["nginx", "-g", "daemon off;"]` | ✅ `ENTRYPOINT ["nginx"]` |
| Example: Running a script with arguments | ✅ `CMD ["python", "app.py"]` | ✅ `ENTRYPOINT ["python", "app.py"]` |

---

## **🚀 Overriding `ENTRYPOINT`**
If you really **want to override `ENTRYPOINT`**, you can use:
```bash
docker run --entrypoint /bin/bash ubuntu-image
```
🔹 This **forces a new command** instead of the defined `ENTRYPOINT`.

---

### **🔥 Summary**
1️⃣ Use **`CMD`** when you want a **default command that can be overridden**.  
2️⃣ Use **`ENTRYPOINT`** when you want a **fixed command that always runs**.  
3️⃣ **Combine both** if you want `ENTRYPOINT` to define a command and `CMD` to provide default arguments.

🚀 **Now you know when to use `CMD` vs `ENTRYPOINT`!**.
---
## **🌍 Understanding `ENV` in Docker**
The `ENV` instruction in Docker **sets environment variables** inside a container. These variables help configure applications dynamically **without modifying the Docker image**.

---

## **1️⃣ Setting Environment Variables in a Dockerfile**
You can define environment variables using the `ENV` instruction:

### **Example:**
```dockerfile
FROM ubuntu:22.04

# Set environment variables
ENV FLASK_ENV=production
ENV SECRET_KEY=mysecretkey

WORKDIR /app
COPY app2.py .

CMD ["python3", "app2.py"]
```

### **Accessing the variables inside the container:**
Once the container runs, you can check the variables using:
```bash
echo $FLASK_ENV
echo $SECRET_KEY
```
🔹 **Output:**
```
production
mysecretkey
```

---

## **2️⃣ Passing Environment Variables at Runtime**
Instead of hardcoding values inside the `Dockerfile`, you can **pass environment variables dynamically** when running the container:

```bash
docker run -d -p 3000:3000 -e FLASK_ENV=development -e SECRET_KEY=mydynamicsecret flask-app
```

Inside the container, these values will override any defaults set in the `Dockerfile`.

---

## **3️⃣ Using `.env` Files**
If you have multiple environment variables, you can store them in a **`.env` file** instead of passing them manually.

📄 **`.env` file:**
```env
FLASK_ENV=production
SECRET_KEY=mysecretkey
DATABASE_URL=mysql://user:password@db:3306/mydb
```

Run the container with:
```bash
docker run --env-file .env -d flask-app
```

---

## **4️⃣ Accessing Environment Variables in a Flask App**
Inside `app2.py`, you can retrieve environment variables in Python:

```python
import os
from flask import Flask

app = Flask(__name__)

# Read environment variables
flask_env = os.getenv("FLASK_ENV", "development")  # Default: development
secret_key = os.getenv("SECRET_KEY", "defaultsecret")

@app.route("/")
def home():
    return f"Flask is running in {flask_env} mode with secret key: {secret_key}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
```
📌 **This ensures your app can use dynamic values from `ENV` variables.**

---

## **5️⃣ Checking Environment Variables in a Running Container**
To check environment variables inside a running container:
```bash
docker exec -it container_name env
```
or
```bash
docker inspect container_name | grep -i env
```

---

## **🎯 Summary**
| **Method**                        | **Command / Configuration** |
|----------------------------------|----------------------------|
| Define in `Dockerfile`            | `ENV VAR=value` |
| Pass in `docker run`              | `-e VAR=value` |
| Use a `.env` file                 | `--env-file .env` |
| Access in Python (`os.getenv()`)  | `os.getenv("VAR", "default")` |
| Check in running container        | `docker exec -it container_name env` |

---
### **🛠 Controlling CPU & Memory Usage in Docker (`--cpus` & `--memory`)**
Docker allows you to **limit the CPU and memory usage** of containers using the `--cpus` and `--memory` flags when running a container.

---

## ✅ **1️⃣ `--cpus` (Limit CPU Usage)**
You can limit how much CPU a container can use.

### **Example: Limit Container to 1.5 CPUs**
```bash
docker run --cpus="1.5" ubuntu
```
🔹 This means the container can use **up to 1.5 CPU cores**.

### **✅ Running a Stress Test Example**
```bash
docker run --rm --cpus="1.0" progrium/stress --cpu 2
```
🔹 The container **requests 2 CPU cores** but is limited to **only 1 core**.

---

## ✅ **2️⃣ `--memory` (Limit RAM Usage)**
You can limit how much **RAM (Memory)** a container can use.

### **Example: Limit Memory to 512MB**
```bash
docker run --memory="512m" ubuntu
```
🔹 This limits the container **to 512MB RAM**.

### **✅ Limit Memory + Swap**
```bash
docker run --memory="512m" --memory-swap="1g" ubuntu
```
🔹 This allows **512MB of RAM** and **up to 1GB including swap**.

---

## ✅ **3️⃣ Combining CPU & Memory Limits**
You can set both **CPU and memory limits** at the same time.

### **Example: Limit CPU to 1 Core & RAM to 1GB**
```bash
docker run --cpus="1" --memory="1g" ubuntu
```
🔹 The container:
- Uses **a maximum of 1 CPU core**.
- Uses **a maximum of 1GB RAM**.

---

## ✅ **4️⃣ Using Resource Limits in `docker-compose.yml`**
If you're using **Docker Compose**, you can set CPU & memory limits in `docker-compose.yml`.

### **Example: Limit CPU & RAM in Compose**
```yaml
version: "3.8"

services:
  web:
    image: nginx
    deploy:
      resources:
        limits:
          cpus: "1.5"
          memory: "512M"
        reservations:
          cpus: "0.5"
          memory: "256M"
```
🔹 **Explanation:**
- `limits:` → The **maximum** resources the container can use.
- `reservations:` → The **minimum guaranteed** resources.

---

## ✅ **5️⃣ Check Resource Usage of a Running Container**
### **🔹 View Container Stats**
Run:
```bash
docker stats
```
🔹 This shows **real-time CPU & memory usage** for all running containers.

---

## **🎯 Summary**
| **Option** | **Example** | **Description** |
|-----------|------------|----------------|
| `--cpus` | `--cpus="1.5"` | Limit to **1.5 CPU cores** |
| `--memory` | `--memory="512m"` | Limit to **512MB RAM** |
| `--memory-swap` | `--memory="512m" --memory-swap="1g"` | Allow up to **1GB including swap** |
| **Docker Compose** | `cpus: "1.5", memory: "512M"` | Set limits in `docker-compose.yml` |
| **Monitor Usage** | `docker stats` | View real-time resource usage |
 
---
## **🛠 Managing Volumes in Docker (`volumes`)**
Docker **volumes** are used to **persist data** and share files between containers and the host system.

---

## ✅ **1️⃣ Why Use Volumes?**
- 🔹 **Data Persistence** → Keeps data even if the container is removed.
- 🔹 **Sharing Data** → Allows multiple containers to access the same files.
- 🔹 **Performance** → Volumes are faster than bind mounts.

---

## ✅ **2️⃣ Creating & Using Volumes**
### **🔹 Create a Named Volume**
```bash
docker volume create my_volume
```
🔹 **Verify the volume:**
```bash
docker volume ls
```

### **🔹 Use a Volume When Running a Container**
```bash
docker run -d --name my_container -v my_volume:/data ubuntu
```
🔹 This mounts `my_volume` at `/data` inside the container.

### **🔹 Check Mounted Volumes in a Running Container**
```bash
docker inspect my_container | grep Mounts -A 10
```

---

## ✅ **3️⃣ Using Volumes in `docker-compose.yml`**
You can define volumes inside **`docker-compose.yml`** to persist data.

### **Example: PostgreSQL with a Persistent Volume**
```yaml
version: "3.8"

services:
  db:
    image: postgres:15-alpine
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: mysecretpassword

volumes:
  db_data:
```
🔹 **What happens here?**
- A **named volume (`db_data`)** is created.
- It stores **PostgreSQL data persistently** at `/var/lib/postgresql/data`.

---

## ✅ **4️⃣ Bind Mounts vs. Named Volumes**
Docker supports two types of volume mounting:
| **Type** | **Command Example** | **Use Case** |
|----------|--------------------|--------------|
| **Named Volume** | `-v my_volume:/data` | Best for **data persistence** across containers |
| **Bind Mount** | `-v /home/user/app:/app` | Best for **developing with local files** |

---

## ✅ **5️⃣ Removing Volumes**
### **🔹 Remove a Specific Volume**
```bash
docker volume rm my_volume
```
### **🔹 Remove Unused Volumes**
```bash
docker volume prune
```
## **🛠 Understanding `--mount` in Docker**
Docker provides two ways to mount storage:
1. **`-v` (or `--volume`)** → Simple syntax, mostly for named volumes.
2. **`--mount`** → More explicit and flexible for advanced use cases.

---

## ✅ **1️⃣ Basic `--mount` Usage**
The `--mount` flag requires key-value pairs, making it more readable.

### **Example: Mount a Named Volume**
```bash
docker run -d --name my_container \
  --mount source=my_volume,target=/data \
  ubuntu
```
🔹 This creates a **named volume (`my_volume`)** and mounts it at `/data` inside the container.

---

## ✅ **2️⃣ Bind Mount (Host Path to Container)**
If you want to mount a **specific folder from the host**, use **`type=bind`**.

### **Example: Bind Mount a Local Directory**
```bash
docker run -d --name my_container \
  --mount type=bind,source=/home/user/app,target=/app \
  ubuntu
```
🔹 This mounts the **host folder `/home/user/app`** inside the container at `/app`.

---

## ✅ **3️⃣ Read-Only Mount (Prevent Changes in Container)**
You can **prevent modifications** inside the container using `readonly`.

### **Example: Mount Read-Only**
```bash
docker run -d --name my_container \
  --mount type=bind,source=/home/user/app,target=/app,readonly \
  ubuntu
```
🔹 This means **the container can read `/app`, but cannot write to it.**

---

## ✅ **4️⃣ Using `--mount` in `docker-compose.yml`**
You can define **mounts inside `docker-compose.yml`** like this:

```yaml
version: "3.8"

services:
  app:
    image: ubuntu
    volumes:
      - type: volume
        source: my_volume
        target: /data

volumes:
  my_volume:
```
🔹 This is the equivalent of using `--mount` in `docker run`.

---

## ✅ **5️⃣ `--mount` vs. `-v` (Key Differences)**
| **Feature**  | **`--mount`** | **`-v` / `--volume`** |
|-------------|--------------|------------------|
| **Readability** | ✅ More structured | ❌ Short, but harder to read |
| **Named Volumes** | ✅ Yes | ✅ Yes |
| **Bind Mounts** | ✅ Yes (Explicit) | ✅ Yes (Less Control) |
| **Read-Only Option** | ✅ `readonly` flag | ✅ `/path:/container_path:ro` |
| **Best For** | Advanced setups | Quick and simple use |

---

## ✅ **6️⃣ Checking Mounted Volumes in a Running Container**
To inspect mounts inside a container:
```bash
docker inspect my_container | grep Mounts -A 10
```
To **list all volumes**:
```bash
docker volume ls
```

---

## **🎯 Summary**
| **Command** | **Description** |
|------------|----------------|
| `--mount source=my_volume,target=/data` | Mount a **named volume** |
| `--mount type=bind,source=/path,target=/app` | Mount a **host directory** |
| `--mount type=bind,source=/path,target=/app,readonly` | **Read-only** mount |
| `docker volume ls` | List all **volumes** |
| `docker inspect my_container` | Check **mounts inside a container** |

---
### **🛠 What is a Docker Service?**
A **Docker Service** is a high-level abstraction in **Docker Swarm** that allows you to deploy and manage **containers** across multiple nodes in a **Swarm cluster**. It ensures **scalability, load balancing, and fault tolerance** for your applications.

---

## ✅ **1️⃣ Key Features of Docker Services**
| **Feature** | **Description** |
|------------|----------------|
| **Scalability** | You can run multiple replicas of a service across nodes. |
| **Load Balancing** | Requests are automatically distributed among replicas. |
| **Fault Tolerance** | If a container fails, Swarm automatically restarts it. |
| **Declarative Model** | You define the desired state, and Swarm ensures it is maintained. |

---

## ✅ **2️⃣ Types of Docker Services**
### **🔹 Replicated Services**
- Runs a **specific number of identical replicas** across nodes.
- Example: **3 replicas of a web app**.
  
### **🔹 Global Services**
- Runs **one instance per node** (useful for logging, monitoring, etc.).
- Example: **A monitoring agent that runs on every node**.

---

## ✅ **3️⃣ Creating a Docker Service**
You can create a service using the `docker service create` command.

### **🔹 Example: Deploy a Simple Web Service**
```bash
docker service create --name my-web-app --replicas 3 -p 8080:80 nginx
```
📌 This:
- Creates a **service named `my-web-app`**.
- Runs **3 replicas** across available nodes.
- Publishes **port 80 inside the container to port 8080** on the host.
- Uses the **Nginx** image.

---

## ✅ **4️⃣ Managing Docker Services**
### **🔹 List all services**
```bash
docker service ls
```
📌 Shows running services in the Swarm.

### **🔹 Check details of a specific service**
```bash
docker service ps my-web-app
```
📌 Shows where the service is running.

### **🔹 Scale a service**
```bash
docker service scale my-web-app=5
```
📌 Increases the number of replicas from 3 to **5**.

### **🔹 Update a running service**
```bash
docker service update --image nginx:latest my-web-app
```
📌 Updates the service to use a new image version.

### **🔹 Remove a service**
```bash
docker service rm my-web-app
```
📌 Stops and removes the service.

---

## ✅ **5️⃣ Difference Between a Container and a Service**
| **Feature** | **Container (`docker run`)** | **Service (`docker service create`)** |
|------------|----------------|----------------|
| **Scope** | Runs on a single node | Runs across multiple nodes in Swarm |
| **Scaling** | Must start containers manually | Can scale automatically (`--replicas`) |
| **Fault Tolerance** | No built-in recovery | Automatically restarts failed tasks |
| **Networking** | Uses bridge/host networks | Uses Swarm overlay networking |

---

## **🎯 Summary**
| **Command** | **Description** |
|------------|----------------|
| `docker service create --name my-service --replicas 3 nginx` | Create a service with 3 replicas |
| `docker service ls` | List all services in the Swarm |
| `docker service ps my-service` | Show details of a service |
| `docker service scale my-service=5` | Scale the service to 5 replicas |
| `docker service update --image nginx:latest my-service` | Update the service to a new image |
| `docker service rm my-service` | Remove the service |

### kloudkode lab 
```bash 
docker node ls
docker swarm init --advertise-addr 192.168.121.50 
docker service create --name simple-web-app -e APP_COLOR=pink --replicas=3 -p 8083:8080 kodekloud/webapp-color
docker service update --replicas 4 simple-web-app
```
---
### ** Private Docker Registry with Frontend **

🚀 **This project sets up a private Docker registry and a web frontend to manage images.**

---

## **1️⃣ Start the Private Docker Registry**
```bash
docker run -d -p 5000:5000 --restart always --name registry registry:2
```
📌 Runs a local Docker registry on port `5000`.

---

## **2️⃣ Push an Image to the Registry**
```bash
docker pull hello-world
docker tag hello-world:latest localhost:5000/hello-world
docker push localhost:5000/hello-world
```
📌 Pulls `hello-world`, tags it for the local registry, and pushes it.

---

## **3️⃣ Verify Images in the Registry**
```bash
docker exec -it registry /bin/sh
ls /var/lib/registry
```
📌 Checks if the image is stored.

---

## **4️⃣ Remove and Re-Pull the Image**
```bash
docker rmi hello-world:latest localhost:5000/hello-world:latest
docker pull localhost:5000/hello-world
```
📌 Deletes and pulls the image from the private registry.

---

## **5️⃣ Deploy a Web Frontend**
```bash
sudo docker run -d -e ENV_DOCKER_REGISTRY_HOST=registry \
  -e ENV_DOCKER_REGISTRY_PORT=5000 -p 8080:80 \
  --link registry:registry konradkleine/docker-registry-frontend:v2
```
📌 Starts a web UI for managing the registry at `http://localhost:8080`.

---

## **6️⃣ Manage the Registry**
🔹 **List images in the registry**:
```bash
curl -X GET http://localhost:5000/v2/_catalog
```
🔹 **List tags of an image**:
```bash
curl -X GET http://localhost:5000/v2/hello-world/tags/list
```
🔹 **Delete an image from the registry**:
```bash
curl -X DELETE http://localhost:5000/v2/hello-world/manifests/$(docker manifest inspect localhost:5000/hello-world | jq -r .config.digest)
```

---

## **🎯 Key Takeaways**
✔ **Run your own private Docker registry**  
✔ **Push & pull images securely**  
✔ **Manage images with a web frontend**  

