letters=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
morse=(.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..)

text_to_morse() {
    read -p "Enter text: " text
    text=$(echo "$text" | tr '[:lower:]' '[:upper:]')

    for ((i=0; i<${#text}; i++))
    do
        ch="${text:$i:1}"

        # Handle space between words
        if [ "$ch" == " " ]; then
            echo -n "/ "
            continue
        fi

        for ((j=0; j<26; j++))
        do
            if [ "$ch" == "${letters[$j]}" ]; then
                echo -n "${morse[$j]} "
            fi
        done
    done
    echo
}

morse_to_text() {
    read -p "Enter Morse code (space separated, / for space): " code

    for symbol in $code
    do
        # Handle word separator
        if [ "$symbol" == "/" ]; then
            echo -n " "
            continue
        fi

        for ((j=0; j<26; j++))
        do
            if [ "$symbol" == "${morse[$j]}" ]; then
                echo -n "${letters[$j]}"
            fi
        done
    done
    echo
}

echo "1. Text to Morse"
echo "2. Morse to Text"
read -p "Choose option: " choice

if [ "$choice" -eq 1 ]; then
    text_to_morse
elif [ "$choice" -eq 2 ]; then
    morse_to_text
else
    echo "Invalid choice!"
fi
