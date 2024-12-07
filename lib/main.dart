import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/SplashScreen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';
import 'package:maceta_inteligente/utilities/methods/firebase_methods.dart';
import 'package:maceta_inteligente/utilities/methods/notifications_methods.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final httpDioRequests = HttpDioRequests();
  await httpDioRequests.initialize();

  final notificationService = NotificationService();
  await notificationService.initialize();

  final firebaseMethods = FirebaseMethods(httpDioRequests, notificationService);
  await firebaseMethods.initializeFCM();

  runApp(const GrowSmartApp());
}

class GrowSmartApp extends StatelessWidget {
  const GrowSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App para la gestion de GrowSmart',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey,
              backgroundColor: const Color(0xFF4F4F4F),
              brightness: Brightness.light),
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          useMaterial3: true,
          cardTheme: const CardTheme(
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(23))))),
      home: const SplashScreen(),
    );
  }
}
