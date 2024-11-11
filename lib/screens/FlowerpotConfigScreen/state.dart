import 'package:get/get.dart';
import 'package:maceta_inteligente/models/flowerpot_configs/server_model/server_model.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';

class FlowerpotConfigState extends GetxController {
  late final MyFlowerpotOperationalModel flowerPot;
  FlowerpotConfigState({required this.flowerPot});
  var notificationsEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    notificationsEnabled.value = config.notificationsEnabled;
  }

  FlowerpotConfigs config = FlowerpotConfigs(
    temperatureMax: 30.0,
    temperatureMin: 18.0,
    humidityMax: 80.0,
    humidityMin: 30.0,
    lightMax: 1000.0,
    lightMin: 200.0,
    notificationsEnabled: false,
  );

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    update();
  }
}
