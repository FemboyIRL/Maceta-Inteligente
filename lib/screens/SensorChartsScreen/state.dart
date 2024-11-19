import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';

class SensorDataState extends GetxController {
  late Smartpot flowerPot;

  SensorDataState({required this.flowerPot});

  final flowerPotSensors = <FlowerpotSensor>[
    FlowerpotSensor(
      id: 1,
      potId: 101,
      humidity: 45.0,
      temperature: 22.0,
      lightLevel: 1500.0,
      waterLevel: 10.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 6)),
    ),
    FlowerpotSensor(
      id: 2,
      potId: 101,
      humidity: 50.0,
      temperature: 23.5,
      lightLevel: 1600.0,
      waterLevel: 15.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 5)),
    ),
    FlowerpotSensor(
      id: 3,
      potId: 101,
      humidity: 55.0,
      temperature: 24.0,
      lightLevel: 1700.0,
      waterLevel: 20.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 4)),
    ),
    FlowerpotSensor(
      id: 4,
      potId: 101,
      humidity: 60.0,
      temperature: 22.5,
      lightLevel: 1400.0,
      waterLevel: 18.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 3)),
    ),
    FlowerpotSensor(
      id: 5,
      potId: 101,
      humidity: 65.0,
      temperature: 23.0,
      lightLevel: 1300.0,
      waterLevel: 16.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 2)),
    ),
    FlowerpotSensor(
      id: 6,
      potId: 101,
      humidity: 70.0,
      temperature: 24.5,
      lightLevel: 1200.0,
      waterLevel: 12.0,
      registerDateTime: DateTime.now().subtract(Duration(days: 1)),
    ),
    FlowerpotSensor(
      id: 7,
      potId: 101,
      humidity: 75.0,
      temperature: 25.0,
      lightLevel: 1150.0,
      waterLevel: 8.0,
      registerDateTime: DateTime.now(),
    ),
  ];
}
