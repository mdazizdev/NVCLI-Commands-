
#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"

if [[ -f "$INSTALL_DIR/nvcli" ]]; then
    rm "$INSTALL_DIR/nvcli"
    echo "[OK] NVCLI removed."
else
    echo "[INFO] NVCLI is not installed."
fi

