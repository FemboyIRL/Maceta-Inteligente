import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/RegisterScreen/state.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<RegisterState>(
      init: RegisterState(),
      builder: (state) => Scaffold(
        body: Container(),
      ),);
  }
}