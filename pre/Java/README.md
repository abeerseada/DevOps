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

