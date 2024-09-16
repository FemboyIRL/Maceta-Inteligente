import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/PantallaInicio/screen.dart';

void main() {
  runApp(const GrowSmartApp());
}

class GrowSmartApp extends StatelessWidget {
  const GrowSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mi aplicacion de plantas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}
