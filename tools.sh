#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }

    function1() {
        echo "[1]Debian choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/deb/toolsdeb.sh | sh
    }

    function2() {
        echo "[2]Redhat choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/deb/toolsrh.sh | sh
    }

    # ... define functions 3 to 9 similarly ...

    function8() {
        echo "[8]Pentest choosen"
    }
    echo "lctrev's"
    cat << "EOF"        
  ___ _        _ _   _            _    
 / __| |_  ___| | | | |_ ___  ___| |___
 \__ \ ' \/ -_) | | |  _/ _ \/ _ \ (_-<
 |___/_||_\___|_|_|  \__\___/\___/_/__/
                                       
    
EOF
    printf "Select an option 0-9 \n\n[1] Debian\n[2] Redhat\n[8] Pentest\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main