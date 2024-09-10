#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }
    function1() {
        echo "Debian"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/linux/debian/toolsdeb.sh
    }
    function2() {
        echo "Redhat"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/linux/rh/toolsrh.sh
    }

    function9() {
        echo "[9] Flatpaks choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/linux/flatpaks.sh | sh
    }


    printf "Linux Tools\n\nSelect an option 0-9 \n\n[1] Debian\n[2] Redhat\n[9] Install flatpaks\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main