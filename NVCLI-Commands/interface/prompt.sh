
#!/usr/bin/env bash

show_prompt() {
    local username="${USER:-user}"
    local current_dir="${PWD/#$HOME/~}"

    printf '%s┌──[%s@nvcli]%s\n' \
        "$C_CYAN" "$username" "$C_RESET"

    printf '%s└─[%s]%s $ ' \
        "$C_BLUE" "$current_dir" "$C_RESET"
}

