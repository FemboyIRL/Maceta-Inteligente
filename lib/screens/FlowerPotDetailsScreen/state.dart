import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/plant/server_model.dart/server_model.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';
import 'package:maceta_inteligente/screens/PantallaGraficasSensores/screen.dart';

class FlowerPotDetailsState extends GetxController {
  late final MyFlowerpotOperationalModel flowerPot;
  FlowerPotDetailsState({required this.flowerPot});

  final lastRegisteredSensors = FlowerpotSensor(
    id: 1,
    potId: 101,
    humidity: 45.0,
    temperature: 22.5,
    lightLevel: 300.0,
    waterLevel: 80.0,
    registerDateTime: DateTime.now().subtract(const Duration(hours: 1)),
  );

  //obtenemos los datos de la planta
  final plant = PlantConfigs(
    id: 1,
    plantName: "Spathiphyllum (Peace Lily)",
    maxTemperature: 30.0,
    minTemperature: 15.0,
    maxHumidity: 80.0,
    minHumidity: 40.0,
    maxLightLevel: 3000.0,
    minLightLevel: 100.0,
    plantCares: [
      Recomendation(type: "positive", recommendation: "Riega cada semana"),
      Recomendation(
          type: "negative",
          recommendation: "No colocar en un sitio con poca luz"),
      Recomendation(
          type: "positive",
          recommendation:
              "Fertiliza cada mes durante la primavera y el verano"),
    ],
  );

  void onTapSensors(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SensorDataScreen(flowerPot: flowerPot)));
  }
}