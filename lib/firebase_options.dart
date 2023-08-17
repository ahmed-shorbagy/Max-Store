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
    apiKey: 'AIzaSyDJUWd56-O9-Fo9K4yQH-jlpNAUqnYfm1s',
    appId: '1:1077699425971:web:ded5c5903814aec237e2c6',
    messagingSenderId: '1077699425971',
    projectId: 'max-store-9f35c',
    authDomain: 'max-store-9f35c.firebaseapp.com',
    storageBucket: 'max-store-9f35c.appspot.com',
    measurementId: 'G-598MW71XT7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCsyOuSuGRh_etdPK-7ErFunMoEOULwYA',
    appId: '1:1077699425971:android:34c2b5c18d11f82137e2c6',
    messagingSenderId: '1077699425971',
    projectId: 'max-store-9f35c',
    storageBucket: 'max-store-9f35c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW512iUguKBl0O-99R80e864FNwegIw4c',
    appId: '1:1077699425971:ios:1f894fad806e114037e2c6',
    messagingSenderId: '1077699425971',
    projectId: 'max-store-9f35c',
    storageBucket: 'max-store-9f35c.appspot.com',
    iosClientId: '1077699425971-tj5e9dabm3jnserrel2keepp38i4c8oq.apps.googleusercontent.com',
    iosBundleId: 'com.example.maxStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCW512iUguKBl0O-99R80e864FNwegIw4c',
    appId: '1:1077699425971:ios:7567dcc93daed73437e2c6',
    messagingSenderId: '1077699425971',
    projectId: 'max-store-9f35c',
    storageBucket: 'max-store-9f35c.appspot.com',
    iosClientId: '1077699425971-v7oijimp3m5ftlsb67at7328s31gtrda.apps.googleusercontent.com',
    iosBundleId: 'com.example.maxStore.RunnerTests',
  );
}