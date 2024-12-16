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
##  Conditions

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

```sh
if [ $rocket_status = "failed" ]
then
  rocket-debug $mission_name
fi
```
```sh
if [ -d "/home/bob/caleston" ]
then
  echo "Directory exists"
else
  echo "Directory not found"
fi
``` 
---
## For loop
```sh
for variable in value1 value2 value3
do
    # Commands to execute for each iteration
done
```
```sh
for variable in $(cat file.txt)
do
    # Commands to execute for each iteration
done
```
simple For Loop with a List of Values
Iterating over a list of filenames:

```sh

for file in file1.txt file2.txt file3.txt
do
    echo "Processing $file"
done
```
Using a Sequence
Iterating over a sequence of numbers:

```bash
for i in {1..5}
do
    echo "Number $i"
done
```
Reading from an Array
Iterating over an array of strings:

```bash
fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"
do
    echo "Fruit: $fruit"
done
```
Using a Command Output
Iterating over the output of a command:

```bash
for pid in $(ps -e | awk '{print $1}')
do
    echo "Process ID: $pid"
done
```
Nested For Loops
For more complex operations, you can nest for loops:

```bash
for i in {1..3}
do
    for j in {1..3}
    do
        echo "Pair: $i $j"
    done
done
```
```sh 
for app in $(cat /home/bob/apps.txt)
do
        get_requests=$(cat /var/log/apps/${app}_app.log | grep "GET" | wc -l)
        post_requests=$(cat /var/log/apps/${app}_app.log | grep "POST" | wc -l)
        delete_requests=$(cat /var/log/apps/${app}_app.log | grep "DELETE" | wc -l)
  echo -e " ${app}    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"

done
```
```bash
sed 's/jpeg/jpg/g'
```
s/: Represents the substitute command.
old: The substring to search for (in this case, .jpeg).
new: The replacement substring (in this case, .jpg).
g: Global flag, which means replace all occurrences in the input.