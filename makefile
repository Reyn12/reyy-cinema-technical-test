.PHONY: help clean regen install check-build tester release production fetch-main

help:
	@./scripts/help.sh

clean:
	flutter clean
	flutter pub get

regen:
	dart run build_runner build --delete-conflicting-outputs

install:
	@APK=$$(ls -t build/app/outputs/flutter-apk/*_*.apk 2>/dev/null | head -1); \
	if [ -z "$$APK" ]; then APK=build/app/outputs/flutter-apk/app-release.apk; fi; \
	echo "Installing $$APK"; \
	adb install -r "$$APK"

check-build:
	@./scripts/check_build.sh

tester:
	@./scripts/tester.sh

release:
	@./scripts/release.sh

production:
	@./scripts/production.sh

fetch-main:
	git fetch
	git checkout main
	git pull
