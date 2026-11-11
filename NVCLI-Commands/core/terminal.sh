
#!/usr/bin/env bash

start_terminal() {
    show_banner

    local input

    while true; do
        show_prompt

        if ! IFS= read -r input; then
            echo
            break
        fi

        [[ -z "$input" ]] && continue

        case "$input" in
            exit|quit)
                echo "Leaving NVCLI. Goodbye!"
                break
                ;;

            clear|cls)
                show_banner
                ;;

            help)
                cmd_help
                ;;

            version)
                echo "NVCLI Commands v$NVCLI_VERSION"
                ;;

            info)
                cmd_info
                ;;

            uptime)
                cmd_uptime
                ;;

            disk)
                cmd_disk
                ;;

            memory)
                cmd_memory
                ;;

            date)
                date
                ;;

            *)
                warning "Unknown command: $input"
                echo "Type 'help' to see available commands."
                ;;
        esac
    done
}

