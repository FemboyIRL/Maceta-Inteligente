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
    } catch (e) {
      print('Error al intentar loguearse: $e');
      Get.snackbar('Error', 'Credenciales inválidas');
    }
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
