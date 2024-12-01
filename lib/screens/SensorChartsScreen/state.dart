import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class SensorDataState extends GetxController {
  SensorCardOperationalModel selectedSensor;
  late FlowerpotSensor lastRegisteredSensors;

  SensorDataState({required this.selectedSensor});

  List<SensorCardOperationalModel> sensorCards = [];
  List<FlowerpotSensor> sensorsHistory = [];
  List<SensorHistory> selectedSensorHistory = [];

  @override
  void onInit() async {
    super.onInit();

    var dio = HttpDioRequests();
    await dio.initialize();

    sensorsHistory =
        await dio.getUserSmartpotSensors(selectedSensor.flowerPotId.toString());

    lastRegisteredSensors = sensorsHistory.first;
    lastRegisteredSensors = sensorsHistory.reduce(
        (a, b) => a.registerDateTime.isAfter(b.registerDateTime) ? a : b);

    sensorCards = [
      SensorCardOperationalModel(
          icon: Icons.thermostat,
          label: 'Temperatura',
          value: '${lastRegisteredSensors.temperature}°C',
          color: Colors.red,
          flowerPotId: selectedSensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.water_drop,
          label: 'Humedad',
          value: '${lastRegisteredSensors.humidity}%',
          color: Colors.blue,
          flowerPotId: selectedSensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.opacity,
          label: 'Nivel de agua',
          value: '${lastRegisteredSensors.waterLevel}%',
          color: Colors.blueAccent,
          flowerPotId: selectedSensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.light_mode,
          label: 'Luz',
          value: '${lastRegisteredSensors.lightLevel} lux',
          color: Colors.amber,
          flowerPotId: selectedSensor.flowerPotId),
    ];

    updateSensor(selectedSensor);

    update();
  }

  void updateSensor(SensorCardOperationalModel sensor) {
    selectedSensor = sensor;

    selectedSensorHistory = sensorsHistory.map((entry) {
      double value;
      switch (selectedSensor.label) {
        case 'Temperatura':
          value = entry.temperature;
          break;
        case 'Humedad':
          value = entry.humidity;
          break;
        case 'Nivel de agua':
          value = entry.waterLevel;
          break;
        case 'Luz':
          value = entry.lightLevel;
          break;
        default:
          value = 0.0;
      }

      if (value.isNaN || value.isInfinite) {
        value = 0.0;
      }

      return SensorHistory(
        registerDateTime: entry.registerDateTime,
        value: value,
      );
    }).toList();

    print(selectedSensorHistory.first.value);
    print("aqui toy");

    update();
  }
}

class SensorHistory {
  final DateTime registerDateTime;
  final double value;

  SensorHistory({required this.registerDateTime, required this.value});
}
