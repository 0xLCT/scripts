#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }

    function1() {
        echo "[1] Setup choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/deb/setup.sh | sh
    }

    function2() {
        echo "[2] Install docker choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/deb/docker.sh | sh
    }
    function2() {
        echo "[3] Install synchthing choosen"
        curl -fsS https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/deb/syncthing.sh | sh
    }


    # ... define functions 3 to 9 similarly ...

    function8() {
        echo "[8]Pentest choosen"
    }

    printf "Debian Tools\n\nSelect an option 0-9 \n\n[1] Debian\n[2] Install docker\n[3] Install and enable Syncthing\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main