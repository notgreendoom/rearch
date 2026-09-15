#!/bin/sh
set -e
echo "Installing Rust..."
if ! command -v rustc >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
. "$HOME/.cargo/env"
echo "Rust is ready."
echo "Building rearch..."
cd "$(dirname "$0")"
cargo build --release
echo "Installing rearch..."
mkdir -p "$HOME/.local/bin"
cp target/release/rearch "$HOME/.local/bin/rearch"
chmod +x "$HOME/.local/bin/rearch"
echo "Done!"
echo "Run it with: rearch"
