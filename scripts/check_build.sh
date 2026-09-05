#!/usr/bin/env bash
set -euo pipefail

PACKAGE=$(grep 'applicationId = ' android/app/build.gradle.kts | sed 's/.*applicationId = "\([^"]*\)".*/\1/' | tr -d '\n')
APP_NAME=$(grep 'android:label=' android/app/src/main/AndroidManifest.xml | sed 's/.*android:label="\([^"]*\)".*/\1/' | tr -d '\n')
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //' | tr -d ' \n')
APP_MODE=$(grep '^final appMode' lib/network/environment.dart | sed 's/.*AppEnvironment\.\([^;]*\).*/\1/' | tr -d ' \n')
MOCK_STATUS=$(grep '^final mockStatus' lib/network/environment.dart | sed 's/.*mockStatus = \([^;]*\).*/\1/' | tr -d ' \n')

case "${APP_MODE}" in
  local)
    API_URL=$(grep '^const String localBaseUrl' lib/network/environment.dart | sed "s/.*'\([^']*\)'.*/\1/" | tr -d '\n')
    ;;
  staging)
    API_URL=$(grep '^const String stagingBaseUrl' lib/network/environment.dart | sed "s/.*'\([^']*\)'.*/\1/" | tr -d '\n')
    ;;
  production)
    API_URL=$(grep '^const String productionBaseUrl' lib/network/environment.dart | sed "s/.*'\([^']*\)'.*/\1/" | tr -d '\n')
    ;;
  *)
    API_URL="(unknown appMode: ${APP_MODE})"
    ;;
esac

echo "========================================"
echo "  Current build config"
echo "========================================"
echo "  App name     : ${APP_NAME}"
echo "  Package      : ${PACKAGE}"
echo "  Version      : ${VERSION}"
echo "  App mode     : ${APP_MODE}"
echo "  Mock status  : ${MOCK_STATUS}"
echo "  API URL      : ${API_URL}"
echo "========================================"
