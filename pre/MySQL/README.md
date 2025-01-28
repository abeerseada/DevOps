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