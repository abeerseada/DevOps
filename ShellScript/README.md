# Shell Scripting
```bash
export PATH=$PATH:/path/to/your/directory
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
---
## While
```bash
while [ condition ]
do
    # Commands to execute while the condition is true
done
```
---
## Case
```bash 
case $variable in
    pattern1)
        # Commands to execute if $variable matches pattern1
        ;;
    pattern2)
        # Commands to execute if $variable matches pattern2
        ;;
    *)
        # Commands to execute if no patterns match
        ;;
esac
```
---
## Shebang
```bash
#!/bin/bash
```
---
## Exit code
what is the exit status of the command uptime ?  
Run: **echo $?** immediately after running the command uptime  
---
# Functions
Defining a Function:
```bash
function_name() {
    # Commands to execute
    echo "This is a function."
}
```
OR
```bash
function function_name {
    # Commands to execute
    echo "This is another way to define a function."
}
```
---
## tips
<<- (Indented Here Document)
```bash
cat > file.txt <<- EOF
	Line 1
		Line 2
	Line 3
EOF
```
add excute permission
```bash
chmod +x ~/mycommand
```

```bash
sed -i 's/jpeg/jpg/g'
```
s/: Represents the substitute command.  
old: The substring to search for (in this case, .jpeg).  
new: The replacement substring (in this case, .jpg).  
g: Global flag, which means replace all occurrences in the input.  
---
```bash
echo $((RANDOM%75))
```
One tiny problem, that calculation will give a number between 0 and 74. Enter the same command in the terminal, but add 1 to the calculation to get a random number between 1 and 75.  
```bash
echo $((RANDOM%75+1))
```
let Command in Bash (Arithmetic Operations)
```bash
help let
help test
help [[ expression ]]
echo $?
```
`[ ]`	Basic tests (strings, files, numbers)
`[[ ]]`	Advanced tests (pattern matching, string comparisons)
`(( ))`	Numerical comparisons (recommended for numbers)
```
# 📌 Differences Between `(( ... ))` and `[[ ... ]]` in Bash

In Bash scripting, `(( ... ))` and `[[ ... ]]` are used for conditionals, but they serve different purposes.

## **🔹 Key Differences**

| **Comparison**        | **`(( ... ))`** (Arithmetic) | **`[[ ... ]]`** (General Test) |
|----------------------|----------------|------------------|
| **Usage**           | Used for **numeric** comparisons only | Used for **string, file, and numeric** comparisons |
| **Operators**       | Supports `<=, >=, ==, !=, <, >` | Uses `-le, -ge, -eq, -ne, -lt, -gt` for numbers |
| **Performance**     | ✅ Faster (optimized for numbers) | ❌ Slightly slower (supports multiple data types) |
| **Math Operations** | ✅ Supports calculations | ❌ No arithmetic support |
| **Logical Operators** | ✅ Supports `&&` and `||` directly | ❌ Requires `[ ]` for `&&` and `||` |
| **Example Usage**   | `if (( x <= 10 )); then ... fi` | `if [[ $x -le 10 ]]; then ... fi` |

## **✅ When to Use Each?**
- Use **`(( ... ))`** for **numeric** operations and comparisons.
- Use **`[[ ... ]]`** for **string comparisons, regex, and file checks**.

```bash
if (( NUMBER <= 15 )); then
  echo "$TEXT B:$NUMBER"
elif [[ $NUMBER -le 30 ]]; then
  echo "$TEXT I:$NUMBER"
fi
```
View the **help test** menu to see the operators you can use with the double square brackets
---
```bash
echo -e "\n<txt>\n" 
```
---
# Array
```bash
declare -a RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
declare -p RESPONSES
echo ${RESPONSES[5]}
```
---
# Function
```bash
FUNCTION_NAME() {
  STATEMENTS
}


```
---
# pattern matching
```bash
[[ hello =~ el ]]
```
```bash
QUESTION="test123"

case $QUESTION in
  test?) echo "Matched a single character after 'test'" ;;
  test*) echo "Matched anything after 'test'" ;;
  test[0-9]) echo "Matched a single digit after 'test'" ;;
  *) echo "No match found" ;;
esac
#Matched anything after 'test' ✅
```
You can use regular expression characters as well, but you can't put the pattern in quotes when you do. Using the same syntax, check if **hello world** starts with an `h` by using **^h** as the pattern.  
use **^h.+d$** as the pattern to see if the string starts with an `h`, has at least one character after it, and ends with a `d`.
