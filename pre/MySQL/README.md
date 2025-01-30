Install MySQL:
```sh
brew install mysql
```
Start MySQL Service:
```sh
brew services start mysql
```
Secure MySQL Installation:
```bash
mysql_secure_installation
```
- You'll be prompted to configure the following:
   - Set a root password.
   - Remove anonymous users.
   - Disallow root login remotely.
   - Remove test databases.
   - Reload privilege tables.

Connect to MySQL:
```bash
mysql -u root -p
```
Check MySQL Status:
```bash
brew services list
```
Stop or Restart MySQL:  
```bash
brew services stop mysql
brew services restart mysql
```
Uninstall MySQL (If Needed):
```bash
brew uninstall mysql
```
