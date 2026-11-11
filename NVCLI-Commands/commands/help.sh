
#!/usr/bin/env bash

cmd_help() {
    cat <<'EOF'
NVCLI Commands
Universal command-line toolkit

USAGE:
    nvcli <command> [options]

GENERAL:
    help          Show command help
    version       Show version

SYSTEM:
    info          Show system information
    uptime        Show system uptime
    disk          Show disk usage
    memory        Show memory information

NETWORK:
    ip            Show network IP addresses
    ping [HOST]   Test network connectivity

PACKAGE:
    update        Update package repositories

MAINTENANCE:
    doctor        Check environment and dependencies

EXAMPLES:
    nvcli info
    nvcli disk
    nvcli ping example.com
    nvcli doctor
EOF
}

