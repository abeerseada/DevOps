# Simple Java application

This is a guide to compile and run a simple Java application using the terminal.

## Steps to Compile and Run a Java Program

### 1. Create the Java File
- Write your Java code and save it in a file named `app.java`.
- For example, use the following basic code:

```java
public class app {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### 2. Compile the Java File
- Open a terminal and navigate to the directory where `app.java` is located.
- Compile the file using the `javac` command:

```bash
javac app.java
```

- This will create a file named `app.class` in the same directory.

### 3. Run the Java Program
- Execute the compiled Java program using the `java` command:

```bash
java app
```

- You should see the output:

```bash
Hello, World!
```

### Notes
- Ensure you have Java Development Kit (JDK) installed on your machine.
- To verify your Java installation, run:

```bash
java -version
```

- If Java is not installed, download and install it from the [Oracle Java Downloads](https://www.oracle.com/java/technologies/downloads/) or use a package manager like Homebrew for macOS:

```bash
brew install openjdk
```

### 3. Create a Manifest File
- Create a text file named `MANIFEST.MF` with the following content:

```
Main-Class: app
```

- **Important**: Ensure there is an empty line at the end of the `MANIFEST.MF` file.

### 4. Create the JAR File
- Package the compiled `.class` file into a JAR file using the `jar` command:

```bash
jar cmf MANIFEST.MF app.jar app.class app2.class app3.class 
```

- **Explanation**:
  - `c`: Create a new JAR file.
  - `m`: Include the manifest file.
  - `f`: Specify the output JAR file name (`app.jar`).
  - `app.class`: The compiled class file to include.

### 5. Run the JAR File
- Execute the JAR file using the `java` command:

```bash
java -jar app.jar
```

### Example Output
```bash
Hello, World!
```

---

### Notes
- Ensure you have the Java Development Kit (JDK) installed.
- To verify your Java installation, run:

```bash
java -version
```

- If Java is not installed, refer to the installation instructions in the previous sections.

---

### 6. Generate Javadoc Documentation
- To generate HTML documentation for your Java program, use the `javadoc` tool:

```bash
javadoc -d doc app.java
```

  - `-d doc`: Specifies the output directory for the documentation (`doc` in this case).
  - `app.java`: The source file for which documentation will be generated.

- Ensure your code includes proper Javadoc comments (`/** ... */`) for classes, methods, and parameters.

### 7. View the Generated Documentation
- Navigate to the `doc` directory.
- Open the `index.html` file in your browser to view the documentation.

---

### Troubleshooting
- **Error: `no main manifest attribute, in app.jar`**
  - This happens if the `MANIFEST.MF` file is not included properly or does not specify the `Main-Class` correctly.
  - Ensure your `MANIFEST.MF` file contains:
    ```
    Main-Class: app
    ```
    with an empty line at the end.
  - Recreate the JAR file with:
    ```bash
    jar cmf MANIFEST.MF app.jar app.class
    ```

---

### Notes
- Ensure you have the Java Development Kit (JDK) installed.
- To verify your Java installation, run:

```bash
java -version
```

- If Java is not installed, refer to the installation instructions in the previous sections.

---

You are now ready to compile, package, run your Java applications, and generate documentation efficiently!

---
# Installing Apache Ant

This guide explains how to install Apache Ant on macOS (M1) and Linux systems.

---

## **Installing Ant on macOS (M1)**

### Prerequisites
- Ensure you have Homebrew installed on your macOS system. If not, install it using:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Ant
1. Use the following Homebrew command to install Ant:

```bash
brew install ant
```

2. Verify the installation:

```bash
ant -version
```

You should see the installed version of Ant.

---

## **Installing Ant on Linux**

### Prerequisites
- Ensure you have root or `sudo` privileges on your Linux system.

### Install Ant
1. Use the following `yum` command to install Ant:

```bash
sudo yum install -y ant
```

2. Verify the installation:

```bash
ant -version
```

You should see the installed version of Ant.

---
# Ant 
Compile and generate jar package using ant
```bash 
ant compile jar 
```
---
# Compiling and Packaging a Maven Application

## **Prerequisites**
1. **Ensure Maven is Installed**:
   - Verify Maven installation:
     ```bash
     mvn -version
     ```
   - If Maven is not installed, install it using:
     ```bash
     sudo yum install -y maven
     ```
---

## **Steps to Compile and Package the Application**

### 1. Navigate to the Project Directory
```bash
cd /opt/maven/my-app/
```

### 2. Compile the Application
- Use Maven to compile the source code:
  ```bash
  mvn compile
  ```
- The compiled `.class` files will be placed in the `target/classes/` directory.

### 3. Package the Application
- Package the application into a JAR (or WAR) file using:
  ```bash
  mvn package
  ```
- The packaged file will be located in the `target/` directory. For example:
  ```
  target/my-app-1.0-SNAPSHOT.jar
  ```

---

## **Optional Maven Commands**

### Clean the Build Directory
- Remove old build artifacts before recompiling:
  ```bash
  mvn clean
  ```

### Run Tests
- Run all tests defined in the project:
  ```bash
  mvn test
  ```

### Skip Tests During Packaging
- To package the application without running tests:
  ```bash
  mvn package -DskipTests
  ```

---

## **Verify the Output**
- After packaging, list the contents of the `target/` directory:
  ```bash
  ls target/
  ```
- You should see a file like:
  ```
  my-app-1.0-SNAPSHOT.jar
  ```

---

## **Common Issues**

1. **Missing `pom.xml`**:
   - Ensure the `pom.xml` file exists in the project directory and is correctly configured.

2. **Build Failures**:
   - Check for missing dependencies or errors in the `pom.xml` file.
   - Review the error message for detailed information.

3. **Maven Not Found**:
   - Ensure Maven is installed and available in the system’s PATH.

---
what is output for main app when you run /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar created with maven package?
```bash 
java -cp /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```
# Breaking Down the Command

This document explains the components of the following Java command:

```bash
java -cp /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```

---

### **Command Components**

1. **`java`**:
   - This is the Java Runtime Environment (JRE) command used to run Java applications.

2. **`-cp`** (or `--classpath`):
   - Specifies the **classpath**, which tells Java where to look for compiled classes or JAR files.
   - In this case, the classpath is:
     ```
     /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar
     ```
   - This points to the packaged JAR file created using Maven.

3. **`com.mycompany.app.App`**:
   - Specifies the **fully qualified class name** of the class containing the `main` method.
   - This is the entry point for the application. 
   - Java will look for a method with the following signature in this class:
     ```java
     public static void main(String[] args)
     ```

---

### **Example Scenario**

If the `App` class looks like this:

```java
package com.mycompany.app;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello, Maven Application!");
    }
}
```

When you run the command, the output will be:

```bash
Hello, Maven Application!
```

---


