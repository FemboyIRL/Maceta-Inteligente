import 'package:get/get.dart';
import 'package:maceta_inteligente/models/flowerpot_configs/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class FlowerpotConfigState extends GetxController {
  late final Smartpot flowerPot;
  FlowerpotConfigs config = FlowerpotConfigs(
    smartpotId: 1, // ID de la maceta inteligente
    temperatureMax: 23.0, // Temperatura máxima permitida
    temperatureMin: 12.0, // Temperatura mínima permitida
    humidityMax: 80.0, // Humedad máxima permitida
    humidityMin: 30.0, // Humedad mínima permitida
    lightMax: 1000.0, // Nivel máximo de luz permitido
    lightMin: 200.0, // Nivel mínimo de luz permitido
    notificationsEnabled: true, // Activación de notificaciones
  );

  var notificationsEnabled = false.obs;

  FlowerpotConfigState({required this.flowerPot});

  @override
  void onInit() async {
    super.onInit();

    final dio = HttpDioRequests();

    await dio.initialize();

    // Obtener la configuración
    config = await dio.getSmartpotConfig(flowerPot.id.toString());

    notificationsEnabled.value = config.notificationsEnabled;

    update();
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    update();
  }
}
