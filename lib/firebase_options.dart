// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6Megyay8pTdObiGElfTGcgIYB76ee4EM',
    appId: '1:489045078046:web:ab86daa65430841afa7e0f',
    messagingSenderId: '489045078046',
    projectId: 'duygudas-app',
    authDomain: 'duygudas-app.firebaseapp.com',
    storageBucket: 'duygudas-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAo1m6juoh1LfrkhZbMj98Bi-Z50YQZD6I',
    appId: '1:489045078046:android:6d74cce2886094affa7e0f',
    messagingSenderId: '489045078046',
    projectId: 'duygudas-app',
    storageBucket: 'duygudas-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW2jPKwIAFNsRoPjyijpGySGGjAZpof6Y',
    appId: '1:489045078046:ios:bcdb24e770f584fbfa7e0f',
    messagingSenderId: '489045078046',
    projectId: 'duygudas-app',
    storageBucket: 'duygudas-app.appspot.com',
    iosBundleId: 'com.example.bootcampDuygudasApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCW2jPKwIAFNsRoPjyijpGySGGjAZpof6Y',
    appId: '1:489045078046:ios:bcdb24e770f584fbfa7e0f',
    messagingSenderId: '489045078046',
    projectId: 'duygudas-app',
    storageBucket: 'duygudas-app.appspot.com',
    iosBundleId: 'com.example.bootcampDuygudasApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6Megyay8pTdObiGElfTGcgIYB76ee4EM',
    appId: '1:489045078046:web:c384b29a9ed4bca5fa7e0f',
    messagingSenderId: '489045078046',
    projectId: 'duygudas-app',
    authDomain: 'duygudas-app.firebaseapp.com',
    storageBucket: 'duygudas-app.appspot.com',
  );
}
