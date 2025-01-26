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

*We have added dummy html files and some dependent images to /opt/food directory.Make sure that this content is available on apache page* **kodekloud**
Move dummy content to DocumentRoot directory **/var/www/html/**. Run **sudo mv /opt/food/* /var/www/html/**
**DocumentRoot "/opt/homebrew/var/www"**
