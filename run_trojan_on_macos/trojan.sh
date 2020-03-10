if [ ! -n "$1" ]; then

    echo "Please type 「on」 or 「off」?"

else

    case "$1" in

        on )
            echo "Turning trojan 「on」..."

            brew services run trojan

            brew services list

            networksetup -getsocksfirewallproxy "Wi-Fi"

            networksetup -setsocksfirewallproxy "Wi-Fi" 127.0.0.1 1080

            networksetup -setsocksfirewallproxystate "Wi-Fi" on

            echo "Turned trojan ON!🍺"
            ;;
        off )
            echo "Turning trojan 「off」..."

            brew services stop trojan

            networksetup -setsocksfirewallproxystate "Wi-Fi" off

            echo "Turned trojan OFF!👋"
            ;;
    esac

fi