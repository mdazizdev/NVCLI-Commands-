
#!/usr/bin/env bash

show_banner() {
    clear

    printf '%s' "$C_CYAN"

    cat <<'EOF'
  _   _  __     _______ _     ___
 | \ | | \ \   / / ____| |   |_ _|
 |  \| |  \ \ / / |    | |    | |
 | |\  |   \ V /| |___ | |___ | |
 |_| \_|    \_/  \_____|_____|___|

EOF

    printf '%s' "$C_RESET"

    echo "       NEXVERIX COMMAND INTERFACE"
    echo
    printf "%sWelcome to NVCLI!%s\n" "$C_BLUE" "$C_RESET"
    echo "Version : $NVCLI_VERSION"
    echo "Platform: $PLATFORM"
    echo
    echo "Type 'help' for commands."
    echo "Type 'exit' to leave NVCLI."
    echo
}

