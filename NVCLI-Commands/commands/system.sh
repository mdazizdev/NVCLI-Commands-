
#!/usr/bin/env bash

cmd_info() {
    separator
    echo "NVCLI SYSTEM INFORMATION"
    separator

    echo "Platform        : $PLATFORM"
    echo "Package Manager : $PACKAGE_MANAGER"
    echo "Hostname        : $(hostname 2>/dev/null || echo unknown)"
    echo "Username        : ${USER:-unknown}"
    echo "Shell           : ${SHELL:-unknown}"
    echo "Architecture    : $(uname -m 2>/dev/null)"
    echo "Kernel          : $(uname -r 2>/dev/null)"

    if [[ "$PLATFORM" == "linux" ]] && [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "Distribution    : ${PRETTY_NAME:-Linux}"
    elif [[ "$PLATFORM" == "termux" ]]; then
        echo "Distribution    : Android / Termux"
    fi

    separator
}

cmd_uptime() {
    if command -v uptime >/dev/null 2>&1; then
        uptime
    else
        warning "Uptime utility is unavailable."
    fi
}

cmd_disk() {
    if command -v df >/dev/null 2>&1; then
        df -h "$HOME"
    else
        error "df utility not found."
        return 1
    fi
}

cmd_memory() {
    if command -v free >/dev/null 2>&1; then
        free -h
    elif [[ -r /proc/meminfo ]]; then
        grep -E '^(MemTotal|MemAvailable|SwapTotal|SwapFree):' \
            /proc/meminfo
    else
        warning "Memory information is unavailable."
    fi
}




cmd_doctor() {
    separator
    echo "NVCLI ENVIRONMENT DIAGNOSTICS"
    separator

    printf "Platform: %s\n" "$PLATFORM"
    printf "Package manager: %s\n" "$PACKAGE_MANAGER"

    local tools=(bash uname df ping)

    for tool in "${tools[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            success "$tool is available"
        else
            warning "$tool is missing"
        fi
    done

    if [[ -w "$HOME" ]]; then
        success "Home directory is writable"
    else
        error "Home directory is not writable"
    fi

    separator
    success "Diagnostics completed."
}

