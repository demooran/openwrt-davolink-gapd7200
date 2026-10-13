#!/usr/bin/env bash
set -u

echo "=== Generated images ==="
if [[ -d bin/targets/ipq40xx/generic ]]; then
    find bin/targets/ipq40xx/generic -maxdepth 2 -type f
else
    echo "No image directory exists."
fi
