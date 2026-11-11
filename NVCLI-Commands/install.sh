
#!/usr/bin/env bash

set -e

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

BIN_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share/nvcli"

echo
echo "========================================"
echo "          NVCLI INSTALLER"
echo "========================================"
echo

# Create installation directories
mkdir -p "$BIN_DIR"
mkdir -p "$DATA_DIR"

# Copy project modules
for module in core interface commands; do
    if [[ ! -d "$PROJECT_DIR/$module" ]]; then
        echo "[ERROR] Missing project directory: $module"
        exit 1
    fi

    rm -rf "$DATA_DIR/$module"
    cp -R "$PROJECT_DIR/$module" "$DATA_DIR/"
done

# Copy main application
install -m 755 "$PROJECT_DIR/nvcli" "$DATA_DIR/nvcli"

# Create executable launcher
cat > "$BIN_DIR/nvcli" <<'EOF'
#!/usr/bin/env bash

NVCLI_HOME="$HOME/.local/share/nvcli"

if [[ ! -f "$NVCLI_HOME/nvcli" ]]; then
    echo "[ERROR] NVCLI installation is incomplete."
    exit 1
fi

exec bash "$NVCLI_HOME/nvcli" "$@"
EOF

chmod +x "$BIN_DIR/nvcli"

# Configure PATH
case ":$PATH:" in
    *":$BIN_DIR:"*)
        ;;
    *)
        CONFIG_FILE="$HOME/.bashrc"

        touch "$CONFIG_FILE"

        if ! grep -Fq '.local/bin' "$CONFIG_FILE"; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$CONFIG_FILE"
        fi
        ;;
esac

echo
echo "[OK] NVCLI installed successfully!"
echo
echo "Application: $DATA_DIR"
echo "Launcher:    $BIN_DIR/nvcli"
echo
echo "Run:"
echo "  nvcli"
echo "  nvcli help"
echo "  nvcli info"
echo

