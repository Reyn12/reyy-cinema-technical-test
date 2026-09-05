import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA7Zp5IZDo4HkUh__KFulOptcqS1rLRv4',
    appId: '1:230659502620:android:56e798e55cdf360a1665d9',
    messagingSenderId: '230659502620',
    projectId: 'reyy-cinema-logkar',
    storageBucket: 'reyy-cinema-logkar.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzn1ezY_WKEJy_fJ3QjErCUREeYy00VjY',
    appId: '1:230659502620:ios:273a638b80621a111665d9',
    messagingSenderId: '230659502620',
    projectId: 'reyy-cinema-logkar',
    storageBucket: 'reyy-cinema-logkar.firebasestorage.app',
    iosBundleId: 'com.reyy.cinema',
  );
}
