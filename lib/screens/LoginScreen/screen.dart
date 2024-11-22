import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/LoginScreen/state.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginState>(
      init: LoginState(),
      builder: (state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: _loginForm(context, state),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context, LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _logo(),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Usuario",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) => state.usernameField.value = value,
          decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Ingresa el nombre de usuario"),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Contraseña",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) => state.passwordField.value = value,
          obscureText: state.obscureText.value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintText: "Ingresa la contraseña",
              suffixIcon: IconButton(
                icon: Icon(state.obscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => state.changeObscureText(),
              )),
        ),
        const SizedBox(
          height: 55,
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            height: 45,
            width: 150,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "No tienes una cuenta?",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                InkWell(
                  onTap: () => state.sendToRegisterScreen(context),
                  child: const Text(
                    "Registrate",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => state.sendToForgotPasswordScreen(context),
              child: const Text(
                "Olvidaste tu contraseña?",
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _logo() {
    return Container(
        alignment: Alignment.center,
        child: Image.asset(
          AssetsResources.brandIcon,
          height: 200,
          width: 200,
        ));
  }
}
