import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_sensors/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';

class SensorDataState extends GetxController {
  late Smartpot flowerPot;

  SensorDataState({required this.flowerPot});

  final flowerPotSensors = <FlowerpotSensor>[];
}
