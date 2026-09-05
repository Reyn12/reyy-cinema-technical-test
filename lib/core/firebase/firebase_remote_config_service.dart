import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._();

  static final FirebaseRemoteConfigService instance =
      FirebaseRemoteConfigService._();

  FirebaseRemoteConfig? remoteConfig;
  bool ready = false;

  bool get isReady => ready;

  static const String keyAppVersion = 'app_version';
  static const String keyUpdateUrlAndroid = 'update_url_android';
  static const String keyUpdateUrlIos = 'update_url_ios';
  static const String keyUpdateMessage = 'update_message';
  static const String keyWhatsNew = 'whats_new';

  Future<void> init() async {
    if (Firebase.apps.isEmpty) return;

    try {
      remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig!.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 20),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig!.setDefaults(const {
        keyAppVersion: '1.0.1',
        keyUpdateUrlAndroid:
            'https://play.google.com/store/apps/details?id=com.reyy_cinema',
        keyUpdateUrlIos: 'https://apps.apple.com',
        keyUpdateMessage:
            'Testing Update Dialog. Skip aja, pake remote config firebase btw',
        keyWhatsNew: 'Perbaikan bug|Peningkatan performa',
      });

      ready = true;
      await refresh(retryOnDefault: true);
    } catch (_) {
      ready = false;
    }
  }

  Future<void> refresh({bool retryOnDefault = false}) async {
    if (remoteConfig == null) return;

    await fetchAndActivateOnce();

    var versionValue = remoteConfig!.getValue(keyAppVersion);
    if (retryOnDefault && versionValue.source == ValueSource.valueDefault) {
      await Future<void>.delayed(const Duration(seconds: 2));
      await fetchAndActivateOnce();
    }
  }

  Future<void> fetchAndActivateOnce() async {
    if (remoteConfig == null) return;

    try {
      await remoteConfig!.fetchAndActivate();
    } catch (_) {}
  }

  String getString(String key) {
    if (!ready || remoteConfig == null) return '';
    return remoteConfig!.getString(key);
  }

  String get appVersion => getString(keyAppVersion);

  String get updateMessage => getString(keyUpdateMessage);

  String get whatsNewRaw => getString(keyWhatsNew);

  List<String> get whatsNew {
    final raw = whatsNewRaw.trim();
    if (raw.isEmpty) return const [];

    if (raw.startsWith('[')) {
      try {
        final cleaned = raw
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll('"', '')
            .replaceAll("'", '');
        final items = cleaned
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
        if (items.isNotEmpty) return items;
      } catch (_) {}
    }

    final items = raw
        .split(RegExp(r'[\n|;,]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    if (items.length == 1 && !raw.contains(RegExp(r'[\n|;,]'))) {
      return [raw];
    }

    return items;
  }
}
