import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class SensorDataState extends GetxController {
  late SensorCardOperationalModel sensor;
  late List<FlowerpotSensor> sensorsHistory;
  late SensorCardOperationalModel selectedSensor;
  late FlowerpotSensor lastRegisteredSensors;

  SensorDataState({required this.sensor});

  List<SensorCardOperationalModel> sensorCards = [];

  @override
  void onInit() async {
    super.onInit();

    // Inicializa el servicio Dio para hacer las peticiones
    var dio = HttpDioRequests();
    await dio.initialize();

    // Carga el historial de sensores
    sensorsHistory =
        await dio.getUserSmartpotSensors(sensor.flowerPotId.toString());

    // Obtiene el último sensor registrado
    lastRegisteredSensors = sensorsHistory.first;
    lastRegisteredSensors = sensorsHistory.reduce(
        (a, b) => a.registerDateTime.isAfter(b.registerDateTime) ? a : b);

    // Ahora inicializamos sensorCards después de haber cargado los datos
    sensorCards = [
      SensorCardOperationalModel(
          icon: Icons.thermostat,
          label: 'Temperatura',
          value: '${lastRegisteredSensors.temperature}°C',
          color: Colors.red,
          flowerPotId: sensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.water_drop,
          label: 'Humedad',
          value: '${lastRegisteredSensors.humidity}%',
          color: Colors.blue,
          flowerPotId: sensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.opacity,
          label: 'Nivel de agua',
          value: '${lastRegisteredSensors.waterLevel}%',
          color: Colors.blueAccent,
          flowerPotId: sensor.flowerPotId),
      SensorCardOperationalModel(
          icon: Icons.light_mode,
          label: 'Luz',
          value: '${lastRegisteredSensors.lightLevel} lux',
          color: Colors.amber,
          flowerPotId: sensor.flowerPotId),
    ];

    selectedSensor = sensor;
    update();
  }

  void updateSensor(SensorCardOperationalModel sensor) {
    selectedSensor = sensor;
    update();
  }
}
