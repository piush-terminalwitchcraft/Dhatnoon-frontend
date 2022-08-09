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
        return macos;
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
    apiKey: 'AIzaSyD9ltcKKAXuj4H5KXhoGN_JKztsoPEBTtg',
    appId: '1:694755082868:web:1c07322e99b2df722f0721',
    messagingSenderId: '694755082868',
    projectId: 'dhatnoon-backend',
    authDomain: 'dhatnoon-backend.firebaseapp.com',
    storageBucket: 'dhatnoon-backend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkDWlnoMrYE8sLX-hfUdNNNZjJ6Sc-5xU',
    appId: '1:694755082868:android:3ff3fe5c5ebc21752f0721',
    messagingSenderId: '694755082868',
    projectId: 'dhatnoon-backend',
    storageBucket: 'dhatnoon-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPf_vUqb1y8S5xf6w-Ah77-e5_ZlimrpY',
    appId: '1:694755082868:ios:ce871e37191508182f0721',
    messagingSenderId: '694755082868',
    projectId: 'dhatnoon-backend',
    storageBucket: 'dhatnoon-backend.appspot.com',
    iosClientId: '694755082868-uvs8ee86c7tnv5rfhn3n325l870hq4uh.apps.googleusercontent.com',
    iosBundleId: 'com.example.components',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPf_vUqb1y8S5xf6w-Ah77-e5_ZlimrpY',
    appId: '1:694755082868:ios:ce871e37191508182f0721',
    messagingSenderId: '694755082868',
    projectId: 'dhatnoon-backend',
    storageBucket: 'dhatnoon-backend.appspot.com',
    iosClientId: '694755082868-uvs8ee86c7tnv5rfhn3n325l870hq4uh.apps.googleusercontent.com',
    iosBundleId: 'com.example.components',
  );
}
