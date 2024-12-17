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

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
