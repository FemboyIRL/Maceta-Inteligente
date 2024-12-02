import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/LoginScreen/screen.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class RegisterState extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> register() async {
    isLoading = true;
    update();

    try {
      var dio = HttpDioRequests();

      final response = await dio.registerUser(usernameController.text,
          emailController.text, passwordController.text);

      if (response['user'] != null) {
        Get.snackbar("Registro Exitoso", "Usuario registrado correctamente.");
        Navigator.of(Get.context!)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } catch (e) {
      Get.snackbar("Error", "Hubo un problema al registrar el usuario.");
    } finally {
      isLoading = false;
      update();
    }
  }
}
