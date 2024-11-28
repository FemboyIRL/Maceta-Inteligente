import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/MainMenuScreen/screen.dart';
import 'package:maceta_inteligente/screens/RegisterScreen/screen.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';
import 'package:maceta_inteligente/utilities/methods/geo_locator_methods.dart';
import 'package:maceta_inteligente/utilities/methods/shared_preferences_methods.dart';

class LoginState extends GetxController {
  final usernameField = ''.obs;
  final passwordField = ''.obs;
  final obscureText = true.obs;

  @override
  void onInit() async {
    super.onInit();
    GeoLocatorMethod.determinePosition();
    GeoLocatorMethod.getLocation();
  }

  void changeObscureText() {
    if (obscureText.isFalse) {
      obscureText.value = true;
    } else {
      obscureText.value = false;
    }
    update();
  }

  Future<void> loginToServer() async {
    final username = usernameField.value;
    final password = passwordField.value;

    try {
      final dioRequests = HttpDioRequests();
      final response = await dioRequests.loginUser(username, password);

      final token = response['token'];
      final user = response['user'];

      await SharedPreferencesMethods.saveUserToken(token);
      await SharedPreferencesMethods.saveUserData(
          user['id'], user['username'], user['email']);

      Navigator.push(Get.context!,
          MaterialPageRoute(builder: (context) => const MainMenuScreen()));
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Inicio de sesión exitoso"),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      String errorMessage = 'Credenciales Invalidas.';

      if (e.toString().contains('No se pudo establecer conexión')) {
        errorMessage =
            'No se pudo conectar al servidor. Por favor, verifica tu conexión.';
      } else if (e.toString().contains('Error interno del servidor')) {
        errorMessage =
            'El servidor está experimentando problemas. Intenta más tarde.';
      } else if (e.toString().contains('El proceso fue cancelado')) {
        errorMessage = 'La operación fue cancelada.';
      } else if (e
          .toString()
          .contains('No se pudo conectar al servidor a tiempo')) {
        errorMessage = 'Tiempo de conexión agotado.';
      }

      _showSnackBar(Get.context!, errorMessage);
      print('Error al intentar loguearse: $e');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  void sendToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  void sendToForgotPasswordScreen(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
    usernameField.close();
    passwordField.close();
    obscureText.close();
  }
}
