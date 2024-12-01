import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class FlowerPotDetailsState extends GetxController {
  late final Smartpot flowerPot;
  FlowerPotDetailsState({required this.flowerPot});

  var sensorsHistory = <FlowerpotSensor>[];

  var lastRegisteredSensors = FlowerpotSensor(
    id: 1,
    humidity: 45.0,
    temperature: 22.5,
    lightLevel: 300.0,
    waterLevel: 80.0,
    registerDateTime: DateTime.now().subtract(const Duration(hours: 1)),
  );

  @override
  void onInit() async {
    super.onInit();
    final dio = HttpDioRequests();

    await dio.initialize();

    sensorsHistory = await dio.getUserSmartpotSensors(flowerPot.id.toString());

    lastRegisteredSensors = sensorsHistory.first;

    lastRegisteredSensors = sensorsHistory.reduce(
        (a, b) => a.registerDateTime.isAfter(b.registerDateTime) ? a : b);

    update();
  }

  List<SensorCardOperationalModel> get sensorCards {
    return [
      SensorCardOperationalModel(
          icon: Icons.thermostat,
          label: 'Temperatura',
          value: '${lastRegisteredSensors.temperature}°C',
          color: Colors.red,
          flowerPotId: flowerPot.id),
      SensorCardOperationalModel(
          icon: Icons.water_drop,
          label: 'Humedad',
          value: '${lastRegisteredSensors.humidity}%',
          color: Colors.blue,
          flowerPotId: flowerPot.id),
      SensorCardOperationalModel(
          icon: Icons.opacity,
          label: 'Nivel de agua',
          value: '${lastRegisteredSensors.waterLevel}%',
          color: Colors.blueAccent,
          flowerPotId: flowerPot.id),
      SensorCardOperationalModel(
          icon: Icons.light_mode,
          label: 'Luz',
          value: '${lastRegisteredSensors.lightLevel} lux',
          color: Colors.amber,
          flowerPotId: flowerPot.id),
    ];
  }
}
