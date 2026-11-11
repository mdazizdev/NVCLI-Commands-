
#!/usr/bin/env bash

cmd_update() {
    info "Detected platform: $PLATFORM"
    info "Package manager: $PACKAGE_MANAGER"

    case "$PACKAGE_MANAGER" in
        pkg)
            pkg update
            ;;
        apt)
            apt-get update
            ;;
        dnf)
            dnf makecache
            ;;
        pacman)
            pacman -Sy
            ;;
        zypper)
            zypper refresh
            ;;
        *)
            error "Unsupported package manager."
            return 1
            ;;
    esac

    local result=$?

    if [[ $result -eq 0 ]]; then
        success "Repository update completed."
    else
        error "Repository update failed."
        return "$result"
    fi
}

