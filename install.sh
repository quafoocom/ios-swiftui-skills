#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-$HOME/.codex/skills}"

mkdir -p "$TARGET"
cp -R "$(dirname "$0")/skills/"* "$TARGET/"

echo "Installed iOS SwiftUI skills to: $TARGET"
echo "Installed skills:"
find "$TARGET" -maxdepth 1 -type d -name "ios-*" -o -name "swift-concurrency" -o -name "storekit2-iap" -o -name "widgetkit-activitykit" -o -name "avfoundation-media" -o -name "vision-camera" -o -name "appstore-release" | sort
