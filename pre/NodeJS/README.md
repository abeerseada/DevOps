# Node.js

This document provides a guide for installing Node.js, running applications, and managing packages with npm.

---

## **Installing Node.js**

### On macOS (including M1/M2 chips):

#### Using Homebrew:
1. Install Node.js:
```bash
brew install node
```

2. Verify the installation:
```bash
node -v   # Check Node.js version
npm -v    # Check npm version
```

---

## **Run the Application**

1. Create a JavaScript file (e.g., `app.js`):
   ```javascript
   console.log("Hello, Node.js!");
   ```

2. Run the file with Node.js:
```bash
node app.js
```

---

## **Installing Packages Using npm**

### Install a Package:

1. Use npm to install a package locally:
```bash
npm install express
```

2. If you want to install a package globally:
```bash
npm install -g <package_name>
```

### Common Packages:
- `express`: Web application framework for Node.js.
- `lodash`: Utility library for JavaScript.
- `nodemon`: Automatically restarts the application when changes are made.

---

## **Common Commands**

### Initialize a Node.js Project:

1. Create a `package.json` file with default settings:
```bash
npm init -y
```

2. Open the `package.json` file to customize it if necessary.

### Install Dependencies:

1. Install a specific package:
```bash
npm install <package_name>
```

2. Install all dependencies listed in `package.json`:
```bash
npm install
```

---
Run: **sudo npm install file -g** to install file module globally.
---
## for app.js in this dir
```sh
npm init -y
npm install express
node app.js
```
install dependencies
```sh 
sudo npm install
```
install pm2 
```sh
sudo npm install pm2@latest -g
```
Run app with pm2 and observe the output in console
```sh
pm2 start app.js
```
Run app with pm2 but with 4 forks. observe the output in console:
Run **pm2 delete app.js** to delete pm2 fork. Then run **pm2 start app.js -i 4**