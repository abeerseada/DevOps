# Linux
```bash
rpm -qa
rpm -qa | grep ftp
sudo rpm -e ftp-0.17-89.el9.x86_64
sudo rpm -i /opt/ftp-0.17-89.el9.x86_64.rpm
sudo yum list maven
```
---
```bash
sudo systemctl status httpd
sudo systemctl start httpd
sudo systemctl restart httpd
sudo systemctl stop httpd
sudo systemctl enable httpd
sudo systemctl disable httpd
```
```sh
/etc/httpd/conf/httpd.conf
```
```sh
systemctl status app
○ app.service - My python web application
     Loaded: loaded (/usr/lib/systemd/system/app.service; disabled; preset: disa>
     Active: inactive (dead)
```
```sh
cat /usr/lib/systemd/system/app.service
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
---
# Network
ip link
ip addr 
ip addr add 192.168.1.10/24 dev eth0
ip route 
ip route add 192.168.1.0/24 via 192.168.2.1
cat /proc/sys/net/ipv4/ip_forward

cat /etc/hosts
cat /etc/resolv.conf 
8.8.8.8 
nslookup www.google.com
dig www.google.com
search yahoo.com
---
# Applications
### install *java* for MacOS
brew install openjdk
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.zshrc
echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> ~/.zshrc
javac app.java