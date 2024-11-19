import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/LoginScreen/state.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<LoginState>(
      init: LoginState(),
      builder: (state) => Scaffold(
        body: Container(),
      ),);
  }
}