import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/screens/PantallaCatalago/state.dart';

class CatalogoPlantasPantalla extends StatelessWidget{
  const CatalogoPlantasPantalla({super.key});


  
  @override
  Widget build(BuildContext context){
    return GetBuilder<CatalogoPlantasEstado>(
      init: CatalogoPlantasEstado(),
      builder: (state) => Scaffold(
        body: Container(),
      ),);
  }
}