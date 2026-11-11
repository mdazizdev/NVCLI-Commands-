
#!/usr/bin/env bash

if [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    RED=$'\033[0;31m'
    GREEN=$'\033[0;32m'
    YELLOW=$'\033[0;33m'
    BLUE=$'\033[0;34m'
    CYAN=$'\033[0;36m'
    RESET=$'\033[0m'
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    CYAN=""
    RESET=""
fi

info() {
    printf '%s[INFO]%s %s\n' "$BLUE" "$RESET" "$*"
}

success() {
    printf '%s[OK]%s %s\n' "$GREEN" "$RESET" "$*"
}

warning() {
    printf '%s[WARN]%s %s\n' "$YELLOW" "$RESET" "$*"
}

error() {
    printf '%s[ERROR]%s %s\n' "$RED" "$RESET" "$*" >&2
}

separator() {
    printf '%s\n' "----------------------------------------"
}

