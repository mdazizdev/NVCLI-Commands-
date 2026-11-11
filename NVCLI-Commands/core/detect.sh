
#!/usr/bin/env bash

detect_platform() {
    if [[ -n "${TERMUX_VERSION:-}" ]] || [[ "${PREFIX:-}" == *com.termux* ]]; then
        PLATFORM="termux"
    elif [[ -f /etc/os-release ]]; then
        PLATFORM="linux"
    else
        PLATFORM="unknown"
    fi
}

detect_package_manager() {
    if [[ "$PLATFORM" == "termux" ]]; then
        PACKAGE_MANAGER="pkg"
    elif command -v apt-get >/dev/null 2>&1; then
        PACKAGE_MANAGER="apt"
    elif command -v dnf >/dev/null 2>&1; then
        PACKAGE_MANAGER="dnf"
    elif command -v pacman >/dev/null 2>&1; then
        PACKAGE_MANAGER="pacman"
    elif command -v zypper >/dev/null 2>&1; then
        PACKAGE_MANAGER="zypper"
    else
        PACKAGE_MANAGER="unknown"
    fi
}

