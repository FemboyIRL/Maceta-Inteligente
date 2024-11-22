import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/RegisterScreen/screen.dart';
import 'package:maceta_inteligente/utilities/methods/geo_locator_methods.dart';

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

  
  void sendToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  void sendToForgotPasswordScreen(BuildContext context) {
 
  }

  @override
  void dispose() {
    super.dispose();
    usernameField.close();
    passwordField.close();
    obscureText.close();
  }
}