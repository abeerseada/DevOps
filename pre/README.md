# Linux

### RPM Commands
```bash
rpm -qa
rpm -qa | grep ftp
sudo rpm -e ftp-0.17-89.el9.x86_64
sudo rpm -i /opt/ftp-0.17-89.el9.x86_64.rpm
sudo yum list maven
```

### HTTPD Service Management
```bash
sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl restart httpd
sudo systemctl stop httpd
sudo systemctl enable httpd
sudo systemctl disable httpd
```

### HTTPD Configuration File
```bash
/etc/httpd/conf/httpd.conf
```

### Custom Application Service Example
```sh
systemctl status app
○ app.service - My python web application
     Loaded: loaded (/usr/lib/systemd/system/app.service; disabled; preset: disa>
     Active: inactive (dead)
```

Inspect the service file:
```bash
cat /usr/lib/systemd/system/app.service
```

Example `app.service` file:
```
[Unit]
Description=My python web application

[Service]
ExecStart=/usr/bin/python3 /opt/code/my_app.py
ExecStartPre=/bin/bash /opt/code/configure_db.sh
ExecStartPost=/bin/bash /opt/code/email_status.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

---

# Network

### Networking Commands
```bash
ip link
ip addr 
ip addr add 192.168.1.10/24 dev eth0
ip route 
ip route add 192.168.1.0/24 via 192.168.2.1
cat /proc/sys/net/ipv4/ip_forward
```

### DNS Configuration
```bash
cat /etc/hosts
cat /etc/resolv.conf 
nslookup www.google.com
dig www.google.com
```
**8.8.8.8** dns google
### DNS Search Option
```bash
search yahoo.com
```

---

# Applications

### Installing Java on macOS
```bash
brew install openjdk
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.zshrc
echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> ~/.zshrc
javac app.java
```