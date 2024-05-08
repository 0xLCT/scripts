if [ "$SHELL" = "/bin/bash" ]; then
    while true; do
        echo "Install bash-it? (y/n)"
        read input

        if [ "$input" = "y" ]; then
            echo "Intalling bash-it."
            cd ~
            git clone --depth=1 https://github.com/lctrevizan/bash-it.git ~/.bash_it
            ~/.bash_it/install.sh
            source .bashrc
            bash-it enable plugin history-substring-search sudo
            break
        elif [ "$input" = "n" ]; then
            echo "Not installing bash-it."
            break
        else
            echo "Invalid input. Please try again."
        fi
    done

else
  echo "You are not running Bash."
fi
