// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBWNWoNi6o_XpCgDWX-iJ7ZWDDQIORJV2s',
    appId: '1:134776501899:web:4232ced6710e3a3d6bc68e',
    messagingSenderId: '134776501899',
    projectId: 'messenger-app-48fe4',
    authDomain: 'messenger-app-48fe4.firebaseapp.com',
    storageBucket: 'messenger-app-48fe4.appspot.com',
    measurementId: 'G-K0BE5SJNZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxix08oneRdYFl2JpBJ8H6EYDsFNWqxmM',
    appId: '1:134776501899:android:98f6d3a4faf4ff3f6bc68e',
    messagingSenderId: '134776501899',
    projectId: 'messenger-app-48fe4',
    storageBucket: 'messenger-app-48fe4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfWKzYOY6P28jkr5CWAQu1XK3yTYn6sX0',
    appId: '1:134776501899:ios:b32abdb481bba8606bc68e',
    messagingSenderId: '134776501899',
    projectId: 'messenger-app-48fe4',
    storageBucket: 'messenger-app-48fe4.appspot.com',
    iosClientId: '134776501899-psfrmstrh9v9tnau98ki6tqj25p7g36c.apps.googleusercontent.com',
    iosBundleId: 'ch.bbbaden.lailam335m1839910appsjavaweb.messangerapp',
  );
}
