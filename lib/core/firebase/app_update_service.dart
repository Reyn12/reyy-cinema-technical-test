import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reyy_cinema/core/firebase/firebase_remote_config_service.dart';
import 'package:reyy_cinema/widget/update_dialog.dart';

class AppUpdateService {
  AppUpdateService._();

  static final AppUpdateService instance = AppUpdateService._();

  Future<bool> checkAndShow(BuildContext context) async {
    final remote = FirebaseRemoteConfigService.instance;
    if (!remote.isReady) {
      debugPrint('Update check skip: RemoteConfig belum ready');
      return false;
    }

    final latestVersion = remote.appVersion.trim();
    if (latestVersion.isEmpty) {
      debugPrint('Update check skip: app_version kosong');
      return false;
    }

    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version;
    final needUpdate = isOlderThan(currentVersion, latestVersion);

    debugPrint(
      'Update check | current=$currentVersion | remote=$latestVersion | '
      'needUpdate=$needUpdate | whatsNew=${remote.whatsNew}',
    );

    if (!needUpdate) return false;
    if (!context.mounted) return false;

    final message = remote.updateMessage.trim();
    final skipped = await UpdateDialog.show(
      context,
      message: message.isEmpty ? null : message,
      currentVersion: currentVersion,
      latestVersion: latestVersion,
      whatsNew: remote.whatsNew,
    );

    return !skipped;
  }

  bool isOlderThan(String current, String latest) {
    final a = parse(current);
    final b = parse(latest);
    final len = a.length > b.length ? a.length : b.length;

    for (var i = 0; i < len; i++) {
      final left = i < a.length ? a[i] : 0;
      final right = i < b.length ? b[i] : 0;
      if (left < right) return true;
      if (left > right) return false;
    }
    return false;
  }

  List<int> parse(String version) {
    return version
        .split(RegExp(r'[.+-]'))
        .map((part) => int.tryParse(part) ?? 0)
        .toList();
  }
}
