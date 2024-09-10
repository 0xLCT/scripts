#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }

    function1() {
        echo "[1]Linux choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/toolsdeb.sh)
    }

    function2() {
        echo "[2]Redhat choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/rh/toolsrh.sh)
    }
    function5() {
        echo "[5]Linux choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/linux/toolslinux.sh)
    }

    function8() {
        echo "[8]Pentest choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/pentest/toolspentest.sh)
    }   
    printf "\nlctrev's\n"
    cat << "EOF"        
  ___ _        _ _   _            _    
 / __| |_  ___| | | | |_ ___  ___| |___
 \__ \ ' \/ -_) | | |  _/ _ \/ _ \ (_-<
 |___/_||_\___|_|_|  \__\___/\___/_/__/
                                       
    
EOF
    printf "Select an option 0-9 \n\n[1] Linux\n[8] Pentest\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main
