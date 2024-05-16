#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }

    function1() {
        echo "[1] Setup choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/setup.sh)
    }

    function2() {
        echo "[2] Install docker choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/docker.sh)
    }
    function3() {
        echo "[3] Install synchthing choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/syncthing.sh)
    }
    function4() {
        echo "[4] Install NodeJS choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/nodeinstall.sh)
    }
    function5() {
        echo "[5] Install VSCode choosen"
        bash <(curl -s https://raw.githubusercontent.com/lctrevizan/scripts/master/deb/nodeinstall.sh)
    }



    # ... define functions 3 to 9 similarly ...

    function8() {
        echo "[8]Pentest choosen"
    }

    printf "Debian Tools\n\nSelect an option 0-9 \n\n[1] Initial setup\n[2] Install docker\n[3] Install and enable Syncthing\n[4] Install NodeJS\n[5] Install VSCode\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main