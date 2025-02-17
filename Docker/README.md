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

