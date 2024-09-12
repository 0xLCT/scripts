main() {
    function0() {
        echo "Exiting..."
        exit
    }
    function1() {
        echo "FLAC to MP3 selected"
        bash <(curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/convert/flacto320andv0.sh)
    }
    function2() {
        echo "WebP to PNG selected"
        bash <(curl -fsS https://raw.githubusercontent.com/lctrevizan/debscripts/main/convert/webpToPng.sh)
    }
    


    printf "Convert Tools\n\nSelect an option 0-9 \n\n[1] FLAC to MP3\n[2] WebP to PNG\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main