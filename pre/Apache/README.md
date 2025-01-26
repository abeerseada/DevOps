## Install Apache
Open the Terminal and run the following command to install Apache:
```sh
brew install httpd
```
After the installation is complete, you can check the version of Apache:
```sh
httpd -v
```
## Start Apache
Start the Apache server:
```sh
sudo brew services start httpd
```
Check if Apache is running:
```sh
sudo brew services list
```
You should see **httpd** listed with the status **started**.
---
Change the port:
```sh
vi /opt/homebrew/etc/httpd/httpd.conf
```
then restart:
```sh
sudo brew services restart httpd
```
Create a simple test page:
```sh
vi /opt/homebrew/var/www/index.html
```
stop:
```sh
sudo brew services stop httpd
```
install and start apache for Linux :
```sh
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl status httpd
```
---
*We have added dummy html files and some dependent images to /opt/food directory.Make sure that this content is available on apache page* **kodekloud**
Move dummy content to DocumentRoot directory **/var/www/html/**. Run **sudo mv /opt/food/* /var/www/html/**
**DocumentRoot "/opt/homebrew/var/www"**
---
# Apache Configuration on macOS M1

This document provides guidance on configuring Apache HTTP Server installed via Homebrew on macOS M1.

---

## **1. Apache Configuration File**

### Default Location
For Apache installed via Homebrew, the main configuration file is located at:
```
/opt/homebrew/etc/httpd/httpd.conf
```

### Editing the Configuration File
To edit the configuration file, use a text editor:
```bash
sudo nano /opt/homebrew/etc/httpd/httpd.conf
```

---

## **2. Key Configuration Settings**

### **1. Listen (Port Number)**
- Defines the port Apache listens to for incoming requests.
- Default:
  ```
  Listen 8080
  ```
- To change to port 80:
  ```
  Listen 80
  ```

### **2. DocumentRoot (Website Files Location)**
- Specifies the directory where website files are served from.
- Default:
  ```
  DocumentRoot "/opt/homebrew/var/www"
  ```
- To change to a custom directory:
  ```
  DocumentRoot "/Users/yourusername/Sites"
  ```
- Update the `<Directory>` block as well:
  ```
  <Directory "/Users/yourusername/Sites">
      Options Indexes FollowSymLinks
      AllowOverride All
      Require all granted
  </Directory>
  ```

### **3. ServerName**
- Sets the hostname for the server.
- Default (commented out):
  ```
  # ServerName www.example.com:8080
  ```
- Example:
  ```
  ServerName localhost
  ```

### **4. Load Modules**
- Apache uses modules to extend functionality (e.g., SSL, PHP).
- Example:
  ```
  LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so
  ```
- Uncomment the corresponding `LoadModule` line to enable it.

### **5. Virtual Hosts**
- Host multiple websites on the same server using virtual hosts.
- Example:
  ```
  <VirtualHost *:80>
      ServerName example.com
      DocumentRoot "/Users/yourusername/Sites/example"
      <Directory "/Users/yourusername/Sites/example">
          Options Indexes FollowSymLinks
          AllowOverride All
          Require all granted
      </Directory>
  </VirtualHost>
  ```

### **6. Enabling `.htaccess` Files**
- To allow `.htaccess` files to override configuration, modify the `<Directory>` block for your `DocumentRoot`:
  ```
  <Directory "/opt/homebrew/var/www">
      Options Indexes FollowSymLinks
      AllowOverride All
      Require all granted
  </Directory>
  ```

---

## **3. Restarting Apache**
After making changes to the configuration file, restart Apache to apply them:
```bash
sudo brew services restart httpd
```

---

## **4. Troubleshooting**

### Syntax Errors
Check for syntax errors in the configuration file:
```bash
apachectl configtest
```
- If there are no errors, you’ll see:
  ```
  Syntax OK
  ```

### Logs
Check the Apache logs for more details:
- Access Log:
  ```bash
  /opt/homebrew/var/log/httpd/access_log
  ```
- Error Log:
  ```bash
  /opt/homebrew/var/log/httpd/error_log
  ```

---

Let me know if you need further clarification or additional configurations!
