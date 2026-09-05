#!/usr/bin/env bash
set -euo pipefail

echo "Available commands:"
echo "  make help         - Tampilkan perintah ini"
echo "  make clean        - Clean project + pub get"
echo "  make regen        - Run build_runner"
echo "  make install      - Install APK terbaru via ADB"
echo "  make check-build  - Cek config build yang aktif"
echo "  make tester       - Build APK release + rename"
echo "  make release      - Build App Bundle + rename"
echo "  make production   - Build APK + AAB release + rename"
echo "  make fetch-main   - Fetch, checkout main, pull"
