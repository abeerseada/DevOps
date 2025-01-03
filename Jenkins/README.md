# Jenkins 
### installation **(for MacOS apple chip)**
Install the latest LTS version:
```bash
brew install jenkins-lts
```
Start the Jenkins service: 
```bash
brew services start jenkins-lts
```
Restart the Jenkins service: 
```bash
brew services restart jenkins-lts
```
Update the Jenkins version: 
```bash
brew upgrade jenkins-lts
```
### installation **(for Linux)**
[https://www.jenkins.io/doc/book/installing/linux/]
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
Installation of Java
```bash
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version
```
Restarting Jenkins Service:
```bash
sudo systemctl restart jenkins
```
Check if Jenkins is in Active/Running state:
```bash
sudo systemctl status jenkins
```
---
Run the below command to check logs for Jenkins.
```bash
sudo journalctl -xeu jenkins.service 
```
---
## change Jenkins port 
stop Jenkins 
```sh 
brew services stop jenkins-lts
```
```sh
sudo nano /opt/homebrew/opt/jenkins-lts/homebrew.mxcl.jenkins-lts.plist
```
next change port, then restart Jenkins
```sh
brew services restart jenkins-lts
```
```sh
cd /Users/abeerabdelhameed/.jenkins/workspace/ 
```
