#!/usr/bin/env bash
set -Eeuo pipefail

EXTRA_FILE="../src/generic-extra.mk"
IMAGE_FILE="target/linux/ipq40xx/image/generic.mk"
IMAGE_DIR="target/linux/ipq40xx/image"

echo "=== Validate input files ==="
[[ -f "$EXTRA_FILE" ]] || { echo "ERROR: Missing $EXTRA_FILE"; exit 1; }
[[ -f "$IMAGE_FILE" ]] || { echo "ERROR: Missing $IMAGE_FILE"; exit 1; }

echo "=== Source device definition ==="
cat "$EXTRA_FILE"

echo "=== Register device definition (idempotent) ==="
if grep -R -F -q 'Device/davolink_gapd-7200' "$IMAGE_DIR"; then
    echo "Device definition already exists."
else
    {
        printf '\n\n'
        cat "$EXTRA_FILE"
        printf '\n'
    } >> "$IMAGE_FILE"
    echo "Appended device definition to $IMAGE_FILE"
fi

echo "=== Verify device definition ==="
grep -R -n -F 'Device/davolink_gapd-7200' "$IMAGE_DIR"

echo "=== Verify target registration ==="
grep -R -n -E 'TARGET_DEVICES.*davolink_gapd-7200' "$IMAGE_DIR"

echo "=== Registration check complete ==="
