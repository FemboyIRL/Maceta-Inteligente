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
    apiKey: 'AIzaSyB9zjofpdZQMhLBq4NXwyMCSBWVrKoVbqU',
    appId: '1:1007680945961:web:e0d0c739b3c23f99600138',
    messagingSenderId: '1007680945961',
    projectId: 'growsmart-6debd',
    authDomain: 'growsmart-6debd.firebaseapp.com',
    storageBucket: 'growsmart-6debd.firebasestorage.app',
    measurementId: 'G-VTJ6W8XL46',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4GHf5OTQL7KkGfOSX0sd4IjBKZwKs9Cs',
    appId: '1:1007680945961:android:f86ded6d4dc66530600138',
    messagingSenderId: '1007680945961',
    projectId: 'growsmart-6debd',
    storageBucket: 'growsmart-6debd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMiY4jl2EOfEIDJr2J-77LFD63t-x_5XE',
    appId: '1:1007680945961:ios:fc8f77b7a8969ae3600138',
    messagingSenderId: '1007680945961',
    projectId: 'growsmart-6debd',
    storageBucket: 'growsmart-6debd.firebasestorage.app',
    iosBundleId: 'com.example.macetaInteligente',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMiY4jl2EOfEIDJr2J-77LFD63t-x_5XE',
    appId: '1:1007680945961:ios:fc8f77b7a8969ae3600138',
    messagingSenderId: '1007680945961',
    projectId: 'growsmart-6debd',
    storageBucket: 'growsmart-6debd.firebasestorage.app',
    iosBundleId: 'com.example.macetaInteligente',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB9zjofpdZQMhLBq4NXwyMCSBWVrKoVbqU',
    appId: '1:1007680945961:web:d4ee7f490c8ea34e600138',
    messagingSenderId: '1007680945961',
    projectId: 'growsmart-6debd',
    authDomain: 'growsmart-6debd.firebaseapp.com',
    storageBucket: 'growsmart-6debd.firebasestorage.app',
    measurementId: 'G-VGF6WTBW4T',
  );
}
