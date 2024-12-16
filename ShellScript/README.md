# Shell Scripting
```bash
export PATH=$PATH:/path/to/your/directory
```
add excute permission
```bash
chmod +x ~/mycommand
```
```shell
price=$(( $1 * $2 ))

echo "The total price for items is ${price} dollars"
```
```shell 
num1=$1
num2=$2
num3=$3
sum=$(( num1 + num2 + num3 ))
average=$(echo "$sum /3 " | bc -l)
echo $average
```
---
## Conditions

| Operator      | Description                                                | Example                     |
|---------------|------------------------------------------------------------|-----------------------------|
| `-eq`         | Checks if two integers are equal                           | `[ $a -eq $b ]`              |
| `-ne`         | Checks if two integers are not equal                       | `[ $a -ne $b ]`              |
| `-lt`         | Checks if the first integer is less than the second        | `[ $a -lt $b ]`              |
| `-le`         | Checks if the first integer is less than or equal to the second | `[ $a -le $b ]`          |
| `-gt`         | Checks if the first integer is greater than the second     | `[ $a -gt $b ]`              |
| `-ge`         | Checks if the first integer is greater than or equal to the second | `[ $a -ge $b ]`      |
| `=`           | Compares if two strings are equal                          | `[ "$a" = "$b" ]`            |
| `!=`          | Compares if two strings are not equal                      | `[ "$a" != "$b" ]`           |
| `-z`          | Checks if a string is empty                                | `[ -z "$string" ]`           |
| `-n`          | Checks if a string is not empty                            | `[ -n "$string" ]`           |
| `-e`          | Checks if a file exists                                   | `[ -e file.txt ]`            |
| `-f`          | Checks if a file exists and is a regular file              | `[ -f file.txt ]`            |
| `-d`          | Checks if a directory exists                              | `[ -d dir_name ]`            |
| `-r`          | Checks if a file is readable                               | `[ -r file.txt ]`            |
| `-w`          | Checks if a file is writable                               | `[ -w file.txt ]`            |
| `-x`          | Checks if a file is executable                             | `[ -x file.txt ]`            |
| `&&`          | Logical AND                                              | `[ $a -eq 1 ] && [ $b -eq 2 ]`|
| `||`          | Logical OR                                               | `[ $a -eq 1 ] || [ $b -eq 2 ]`|
| `!`           | Logical NOT                                              | `[ ! -e file.txt ]`          |


| Operator  | Description                                   | Example                |
|------------|---------------------------------------------|------------------------|
| `=`        | Compares if two strings are equal              | `[ "$a" = "$b" ]`       |
| `!=`       | Compares if two strings are not equal          | `[ "$a" != "$b" ]`      |
| `-z`       | Checks if a string is empty                    | `[ -z "$string" ]`      |
| `-n`       | Checks if a string is not empty                | `[ -n "$string" ]`      |
| `*`        | Checks if a string matches a pattern           | `[ "$string" == *pattern* ]` |

| Operator  | Description                                   | Example                |
|------------|---------------------------------------------|------------------------|
| `-e`       | Checks if a file exists                       | `[ -e file.txt ]`       |
| `-f`       | Checks if a file exists and is a regular file  | `[ -f file.txt ]`       |
| `-d`       | Checks if a directory exists                  | `[ -d dir_name ]`       |
| `-r`       | Checks if a file is readable                   | `[ -r file.txt ]`       |
| `-w`       | Checks if a file is writable                   | `[ -w file.txt ]`       |
| `-x`       | Checks if a file is executable                 | `[ -x file.txt ]`       |

