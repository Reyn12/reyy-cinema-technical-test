#!/usr/bin/env bash
set -euo pipefail

flutter clean
flutter pub get
flutter build apk --release
flutter build appbundle

APP_NAME=$(grep 'android:label=' android/app/src/main/AndroidManifest.xml | sed 's/.*android:label="\([^"]*\)".*/\1/' | tr ' ' '_' | tr -d '\n')
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //' | tr -d ' \n' | sed 's/+/_/')

cp build/app/outputs/flutter-apk/app-release.apk "build/app/outputs/flutter-apk/${APP_NAME}_${VERSION}.apk"
cp build/app/outputs/bundle/release/app-release.aab "build/app/outputs/bundle/release/${APP_NAME}_${VERSION}.aab"

echo "APK renamed to ${APP_NAME}_${VERSION}.apk"
echo "AAB renamed to ${APP_NAME}_${VERSION}.aab"
