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