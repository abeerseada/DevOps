# Linux
---
### Alias 
```bash
alias sshcentos='ssh abeer@centos'
vi ~/.bash_profile #add alias sshcentos='ssh abeer@centos'
source ~/.bash_profile 
```
---
### File size
```bash
du -sh file.txt
```
---
# **🔹 `tar` Command in Linux**

The `tar` command (**Tape Archive**) is used in Linux to **create, extract, and manage archive files**. It is commonly used to bundle multiple files into a single `.tar` archive, optionally compressing them using `gzip` or `bzip2`.

---

## **✅ 1️⃣ Creating a `.tar` Archive**

### **Basic syntax:**
```bash
tar -cf archive.tar file1 file2 directory/
```

### **Options:**
- `-c` → **Create** a new archive.
- `-f archive.tar` → Name of the output archive file.
- `file1 file2 directory/` → Files or directories to include in the archive.

### **Example:**
```bash
tar -cf backup.tar /home/user/Documents
```
✅ This creates `backup.tar` containing the `Documents` folder.

---

## **✅ 2️⃣ Listing Contents of an Archive**

```bash
tar -tf archive.tar
```

- `-t` → **List** files inside an archive.
- `-f archive.tar` → Specify which archive to inspect.

### **Example:**
```bash
tar -tf backup.tar
```
✅ Lists all files inside `backup.tar`.

---

## **✅ 3️⃣ Extracting a `.tar` Archive**

```bash
tar -xf archive.tar
```

- `-x` → **Extract** files from the archive.
- `-f archive.tar` → Specify which archive to extract.

### **Example:**
```bash
tar -xf backup.tar
```
✅ Extracts all files from `backup.tar` in the **current directory**.

---

## **✅ 4️⃣ Creating a Compressed Archive (`.tar.gz` or `.tar.bz2`)**

| Compression | Command | Description |
|------------|---------|-------------|
| **gzip (`.tar.gz`)** | `tar -czf archive.tar.gz file1` | Compress using gzip. |
| **bzip2 (`.tar.bz2`)** | `tar -cjf archive.tar.bz2 file1` | Compress using bzip2. |
| **xz (`.tar.xz`)** | `tar -cJf archive.tar.xz file1` | Compress using xz (better compression). |

### **Example:**
```bash
tar -czf backup.tar.gz /home/user/Documents
```
✅ Creates a **compressed archive** using gzip.

---

## **✅ 5️⃣ Extracting a Compressed Archive**

| Archive Type | Extraction Command |
|-------------|------------------|
| `.tar.gz` | `tar -xzf archive.tar.gz` |
| `.tar.bz2` | `tar -xjf archive.tar.bz2` |
| `.tar.xz` | `tar -xJf archive.tar.xz` |

### **Example:**
```bash
tar -xzf backup.tar.gz
```
✅ Extracts `backup.tar.gz` in the **current directory**.

---

## **✅ 6️⃣ Extract to a Specific Directory**

```bash
tar -xf archive.tar -C /path/to/destination/
```

- `-C /path/to/destination/` → Extracts files to a **specific directory**.

---

## **📌 Commonly Used `tar` Commands**

| **Command** | **Description** |
|------------|----------------|
| `tar -cf archive.tar file1 file2` | Create a `.tar` archive. |
| `tar -tf archive.tar` | List files inside an archive. |
| `tar -xf archive.tar` | Extract a `.tar` archive. |
| `tar -czf archive.tar.gz file1` | Create a compressed `.tar.gz` archive. |
| `tar -xzf archive.tar.gz` | Extract a `.tar.gz` archive. |
| `tar -czvf archive.tar.gz file1` | Create `.tar.gz` with **verbose output**. |
| `tar -tvf archive.tar` | List contents of a `.tar` archive in **detailed format**. |

---

## **🚀 Summary**

- `tar` is used to **create, extract, and manage archives**.
- Use `-c` to create, `-x` to extract, `-t` to list contents.
- Combine with **gzip (`-z`)**, **bzip2 (`-j`)**, or **xz (`-J`)** for compression.
---

### Bash promt
```bash
PROJECT=MERCURY
bob@caleston-lp10:~$ echo 'export PROJECT=MERCURY' >> /home/bob/.profile
echo 'alias up=uptime' >> /home/bob/.profile 
PS1='[\d] \u@\h :\w$'
echo "PS1='[\d] \u@\h :\w$'" >> /home/bob/.profile
```
---
### kernel
```bash
uname -r #kernel version
lspci # Lists all PCI devices, including graphics cards, network adapters, and other hardware components.
lsblk  #Displays information about storage devices and partitions, including mounted file systems.
dmesg #Shows kernel messages, useful for debugging hardware issues and boot logs
lscpu #Displays detailed information about the CPU (processor) in your system. Useful for performance monitoring and system diagnostics.
lsmem --summary #memory
free -m
lshw
```
runlevel 0 -> poweroff.target  

runlevel 1 -> rescue.target  

runlevel 2 -> multi-user.target  

runlevel 3 -> multi-user.target  

runlevel 4 -> multi-user.target  

runlevel 5 -> graphical.target  

runlevel 6 -> reboot.target  
```bash
runlevel # => 5 is gui => 3 is commandline
systemctl get-default
ls -ltr /etc/systemd/system/default.target
/etc/systemd/system/default.target -> /usr/lib/systemd/system/graphical.target
sudo systemctl set-default multi-user.target
```
---
### Searching for files and dirs
```bash
locate test.file
find /home/ -name test.file
```
update DB
```bash
updatedb
```
---
## Grep


### **Basic syntax:**

```bash
grep [options] "pattern" filename
```

### **Options:**

- `-i` → Case-insensitive search.
- `-v` → Invert match (exclude lines that match).
- `-r` → Recursive search through directories.
- `-n` → Show line numbers.
- `-l` →	Show only filenames with matches.
- `-c` →	Count the number of matches in each file.
- `-w` →	Match whole words only.
- `-A [num]` →	Show [num] lines after a match.
- `-B [num]` →	Show [num] lines before a match.
- `-C [num]` →	Show [num] lines after and before a match.

### **Example:**

```bash
grep "error" logfile.txt
```

✅ Finds occurrences of "error" in `logfile.txt`.

```bash
grep -ri "critical" /var/log/
```

✅ Recursively searches for "critical" in `/var/log/`.

---

## **📌 Commonly Used ****************`grep`**************** Commands**

| **Command**               | **Description**                  |
| ------------------------- | -------------------------------- |
| `grep "text" file.txt`    | Search for "text" in `file.txt`. |
| `grep -i "text" file.txt` | Case-insensitive search.         |
| `grep -v "text" file.txt` | Exclude lines containing "text". |
| `grep -r "text" /path/`   | Recursively search in `/path/`.  |
| `grep -n "text" file.txt` | Show line numbers for matches.   |

---
### RPM Commands 
```bash
rpm -qa
rpm -qa | grep ftp
sudo rpm -e ftp-0.17-89.el9.x86_64
sudo rpm -i /opt/ftp-0.17-89.el9.x86_64.rpm
sudo yum list maven
```
```bash
rpm -qa | grep wget #version of wget using rpm
```
-q (query) → This option is used to query the RPM database.  
-a (all) → This option lists all installed packages.  
```bash
sudo rpm -ivh firefox-115.12.0-1.el9.x86_64.rpm
```
-i is for install.  
-v is for verbose, which gives you more information about the installation process.  
-h is for hash, which shows a progress bar during installation.  
# yum
```bash
sudo yum repolist
sudo yum provides tcpdump #Which package provides the tcpdump command 
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
ip r #defualt gateway
traceroute
```

### DNS Configuration
```bash
cat /etc/hosts
cat /etc/resolv.conf #DNS
nslookup www.google.com
dig www.google.com
/etc/nsswitch.conf #Name Service Switch configuration file
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
---
# SSL & TLS
On jump host server which is thor@host01 create an SSH public/private key-pair with name mykey at path /home/thor/
Use command **ssh-keygen -t rsa** and specify the path to the key as **/home/thor/.ssh/mykey**.    


Using the mykey SSH key-pair you created in previous question configure passwordless SSH connection between jump host and app01 for user thor. (thor user should already be there on both servers).
Note: There might be passwordless SSH connection between jump host and app01 for user thor but through default SSH keys, make sure to configure the same using the SSH key pair you created.

Copy contents of **/home/thor/.ssh/mykey.pub** public key from jump host and add the same to **/home/thor/.ssh** authorized_keys on app01 server.

OR

You can use this command directly:
```sh 
ssh-copy-id -i ~/.ssh/mykey.pub thor@app01
```
---
JSON:
```bash
cat q5.json | jpath $.car.wheels
cat q13.json | jpath '$[?(@ == "car" || @ == "bike")]'
```
---
# User Management
```bash
useradd bob #add user
passwd bob #add password to user bob
whoami
/etc/passwd #user details
/etc/shadow #user password
sudo groupadd -g 1010 john #add group
 sudo useradd john -g john -s /bin/sh # -s for shell -g for group
```
---
# File Permissions and Ownership
| **Permission**               | **Octal Value**                  |
| ------------------------- | -------------------------------- |
| `Read`    | 4 |
| `Write`    | 2 |
| `Execute`    | 1 |

```bash
chmod ugo+rwx testfile.txt # u => user, g => group, o => other, '+,-' 'r,w,x'
chmod u+rwx,g+r,o-rwx testfile.txt
chown bob:developer tetsfile.txt #change ownership
chgrp andriod tetsfile.txt #change group
sudo chown -R mercury /home/bob/sports
```
-R → Recursive mode, meaning it changes ownership for all files and subdirectories inside /home/bob/sports.
---
# Service Management in Linux

Managing services in Linux is essential for ensuring system stability, performance, and reliability. This guide covers service management using **systemd (`systemctl`)** and **SysVinit (`service`)**.
```bash
sudo systemctl daemon-reload
/etc/systemd/system/
```

Reloads systemd manager configuration without rebooting the system.  
It is used when unit files (.service files) are modified, added, or removed.  
Ensures that systemd recognizes changes made to service files  
## 📌 Checking Service Status
### **Using systemd**
```bash
systemctl status apache2
```
### **Using service (Older Systems)**
```bash
service apache2 status
```

## 🚀 Starting, Stopping, and Restarting Services
### **Start a Service**
```bash
sudo systemctl start apache2
```
```bash
sudo service apache2 start
```

### **Stop a Service**
```bash
sudo systemctl stop apache2
```
```bash
sudo service apache2 stop
```

### **Restart a Service**
```bash
sudo systemctl restart apache2
```
```bash
sudo service apache2 restart
```

### **Reload Service Configuration (Without Restarting)**
```bash
sudo systemctl reload apache2
```

## 🔄 Enable or Disable a Service at Boot
### **Enable a Service to Start on Boot**
```bash
sudo systemctl enable apache2
```

### **Disable a Service from Starting on Boot**
```bash
sudo systemctl disable apache2
```

### **Check if a Service is Enabled at Boot**
```bash
systemctl is-enabled apache2
```

## 📋 Listing Services
### **Show All Active Services**
```bash
systemctl list-units --type=service --state=running
```

### **Show All Services (Running & Stopped)**
```bash
systemctl list-units --type=service
```

## 📜 Viewing Logs
### **View Logs of a Service**
```bash
journalctl -u apache2 --no-pager
```

### **Follow Logs in Real-time**
```bash
journalctl -u apache2 -f
```

## 🛠 Alternative: Managing Services with `service`
For older Linux distributions using **SysVinit** or **Upstart**:
```bash
sudo service apache2 start   # Start service
sudo service apache2 stop    # Stop service
sudo service apache2 restart # Restart service
sudo service apache2 status  # Check status
```

## 📝 Summary Table
| Action | systemd (`systemctl`) | SysVinit (`service`) |
|--------|----------------------|----------------------|
| Start a service | `systemctl start apache2` | `service apache2 start` |
| Stop a service | `systemctl stop apache2` | `service apache2 stop` |
| Restart a service | `systemctl restart apache2` | `service apache2 restart` |
| Check status | `systemctl status apache2` | `service apache2 status` |
| Enable on boot | `systemctl enable apache2` | `chkconfig apache2 on` |
| Disable on boot | `systemctl disable apache2` | `chkconfig apache2 off` |
| View logs | `journalctl -u apache2` | `cat /var/log/syslog` |

## 🎯 Conclusion
- `systemctl` is used in **modern Linux** distributions.
- `service` is for **older Linux** systems with SysVinit.
- Always check logs with `journalctl -u <service>` if troubleshooting is needed.

---
# Passwordless SSH
```bash 
ssh-keygen -t rsa 
```
In `~/.ssh` you will find `id_rsa` and `id_rsa.pub`.  
Now copy `id_rsa.pub` 
```bash 
ssh-copy-id -i ~/.ssh/id_rsa.pub abeer@remote-server
```
```bash
cat ~/.ssh/authorized_keys
```
---
# SCP
### Copy Files from Local to Remote
```bash
# scp [options] source destination
scp /home/abeer/file.txt remote-server:/home/user
```
### Copy Files from Remote to Local
```bash
scp user@remote-server:/home/user/file.txt /local/destination/
```
---
### Which port number does the SSH service use by default? 
```bash
sudo netstat -tulnp | grep ssh
```
---
# IPTables
`iptables` is a firewall tool for Linux used to control network traffic by defining rules that allow or block packets based on IP addresses, ports, and protocols.
```bash
sudo iptables -L -v -n
```
`-L` → Lists all rules.  
`-v` → Shows detailed output.  
`-n` → Displays numerical addresses instead of resolving hostnames.  

Allow Incoming SSH Traffic (Port 22)  
```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
``` 
Block a Specific IP (e.g., 192.168.1.100)
```bash
sudo iptables -A INPUT -s 192.168.1.100 -j DROP
```
Allow All Outgoing Traffic
```bash
sudo iptables -A OUTPUT -j ACCEPT 
```
Block All Incoming Traffic by Default
```bash
sudo iptables -P INPUT DROP
```
Delete a Specific Rule (e.g., Rule #3 in INPUT Chain)
```bash
sudo iptables -D INPUT 3
```
Reset iptables to Default (Flush All Rules)
```bash
sudo iptables -F
```
### Saving and Restoring iptables Rules
```bash
sudo service iptables save
sudo systemctl enable iptables
```

`-A` → Add rule. 
`-P` → Protocol. 
`-s` → Source. 
`-d` → Destination. 
`--dport` → Destination port. 
`-j` → Action to take. 
`-D` → Delete.
`-I` → Insert on top.
---
# CRON
Edit the crontab file:
```bash 
crontap -e
```
View the current user's crontab:
```bash 
crontab -l
```
Remove all cron jobs for the current user:
```bash 
crontab -r
```
List cron jobs for a specific user (as root):
```bash 
crontab -u username -l
```

```pgsql 
* * * * * command-to-execute
- - - - -
| | | | |  
| | | | +---- Day of the week (0 - 6) [Sunday = 0]  
| | | +------ Month (1 - 12)  
| | +-------- Day of the month (1 - 31)  
| +---------- Hour (0 - 23)  
+------------ Minute (0 - 59)
```
```bash 
cat /tmp/system-report.txt
```