# using case and while loop
#!/bin/bash
while true
do
echo "1. Add"
echo "2. Subtract"
echo "3. Multiply"
echo "4. Divide"
echo "5. Average"
echo "6. Quit"
read -p "Enter ur choice: " choice
case $choice in 
    1) read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 + $number2 ))
        ;;
    2)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 )) ;;
    3)
    read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 )) ;;
    4) read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
        ;;
    6)         break ;;
    5) read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(echo " ($number1 + $number2) / 2" | bc -l )    ;;
    *) contiue ;;
esac


done