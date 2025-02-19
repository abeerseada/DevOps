```markdown
# 🗳️ Example Voting App - Docker Swarm Deployment

This project demonstrates how to deploy the **Example Voting App** using **Docker Swarm**. The application consists of multiple microservices, including Redis, PostgreSQL, a voting app, a worker, and a results app.

---

## 🚀 **Deployment Steps**

### **1️⃣ Initialize Docker Swarm**
Before deploying the stack, initialize Docker Swarm on your manager node:
```bash
docker swarm init
```
📌 If you have multiple nodes, add workers using:
```bash
docker swarm join --token <TOKEN> <MANAGER-IP>:2377
```

---

### **2️⃣ Deploy the Stack**
Deploy the stack using the provided `docker-compose-stack.yml` file:
```bash
docker stack deploy --compose-file docker-compose-stack.yml example-voting-stack
```

---

## 🔧 **Stack Overview**
The application consists of the following services:

| **Service**   | **Description** |
|--------------|---------------|
| `redis`      | Stores votes temporarily |
| `db`         | PostgreSQL database to persist votes |
| `vote`       | Frontend where users vote (Flask) |
| `worker`     | Processes votes from Redis to PostgreSQL |
| `result`     | Displays voting results (Node.js) |

---

## 🛠 **Managing the Stack**
### **Check Running Services**
```bash
docker service ls
```

### **Check Logs of a Service**
```bash
docker service logs example-voting-stack_worker
```

### **Check Tasks for a Service**
```bash
docker service ps example-voting-stack_vote
```

### **Scale the Voting App**
```bash
docker service scale example-voting-stack_vote=3
```

### **Remove the Stack**
```bash
docker stack rm example-voting-stack
```

---

## 📌 **Accessing the Application**
- **Voting App** → `http://<SWARM_NODE_IP>:3030`
- **Results App** → `http://<SWARM_NODE_IP>:3031`

📌 Replace `<SWARM_NODE_IP>` with the IP of any worker or manager node.

---

## 🎯 **Troubleshooting**
### 🔹 **Check if all services are running**
```bash
docker service ls
```
If any service has `0/1` replicas, check logs:
```bash
docker service logs example-voting-stack_worker
```

### 🔹 **Verify Redis is storing votes**
```bash
docker exec -it $(docker ps -qf "name=redis") redis-cli
LRANGE votes 0 -1
```

### 🔹 **Verify votes in PostgreSQL**
```bash
docker exec -it $(docker ps -qf "name=db") psql -U postgres -d postgres -c "SELECT * FROM votes;"
```

---