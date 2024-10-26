import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/PantallaMenuPrincipal/screen.dart';

void main() {
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
      home: const MainMenuScreen(),
    );
  }
}
