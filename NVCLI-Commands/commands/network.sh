
#!/usr/bin/env bash

cmd_ip() {
    if command -v ip >/dev/null 2>&1; then
        ip -brief address
    elif command -v hostname >/dev/null 2>&1; then
        hostname -I 2>/dev/null || warning "No IP information available."
    else
        error "No supported IP utility found."
        return 1
    fi
}

cmd_ping() {
    local host="${1:-1.1.1.1}"

    if ! command -v ping >/dev/null 2>&1; then
        error "ping utility is not installed."
        return 1
    fi

    info "Testing connectivity to $host"

    ping -c 4 "$host"
}

