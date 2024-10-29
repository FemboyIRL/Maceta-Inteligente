import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/PantallaLogin/screen.dart';
import 'package:maceta_inteligente/screens/PantallaRegistro/screen.dart';

class EstadoCatalogo extends GetxController {
  void cambiarPantalla(String text, BuildContext context) {
    switch (text) {
      case "Iniciar Sesión":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
      case "Registrarse":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
        break;
    }
  }
}
