import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/LoginScreen/screen.dart';
import 'package:maceta_inteligente/screens/RegisterScreen/state.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart'; // Asegúrate de importar el estado

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Widget _logo() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        AssetsResources.brandIcon,
        height: 200,
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterState>(
      init: RegisterState(),
      builder: (state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _logo(),
                  const SizedBox(height: 30),
                  Text(
                    'Registro',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 30),
                  // Nombre Field
                  TextFormField(
                    controller: state.usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  TextFormField(
                    controller: state.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  // Contraseña Field
                  TextFormField(
                    controller: state.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await state.register();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Registrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen())),
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
