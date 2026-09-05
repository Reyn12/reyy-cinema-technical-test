#!/usr/bin/env bash
set -euo pipefail

flutter pub get
flutter build apk --release

APP_NAME=$(grep 'android:label=' android/app/src/main/AndroidManifest.xml | sed 's/.*android:label="\([^"]*\)".*/\1/' | tr ' ' '_' | tr -d '\n')
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //' | tr -d ' \n' | sed 's/+/_/')

cp build/app/outputs/flutter-apk/app-release.apk "build/app/outputs/flutter-apk/${APP_NAME}_${VERSION}.apk"
echo "APK renamed to ${APP_NAME}_${VERSION}.apk"
