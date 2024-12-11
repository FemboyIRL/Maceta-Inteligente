import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/dialogs/change_config_dialog/screen.dart';
import 'package:maceta_inteligente/models/flowerpot_configs/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class FlowerpotConfigState extends GetxController {
  late final Smartpot flowerPot;
  FlowerpotConfigs config = FlowerpotConfigs(
    smartpotId: 1,
    temperatureMax: 23.0,
    temperatureMin: 12.0,
    humidityMax: 80.0,
    humidityMin: 30.0,
    lightMax: 1000.0,
    lightMin: 200.0,
    notificationsEnabled: true,
  );

  var smartpotId = 0.obs;
  var temperatureMax = 0.0.obs;
  var temperatureMin = 0.0.obs;
  var humidityMax = 0.0.obs;
  var humidityMin = 0.0.obs;
  var lightMax = 0.0.obs;
  var lightMin = 0.0.obs;
  var notificationsEnabled = false.obs;

  FlowerpotConfigState({required this.flowerPot});

  @override
  void onInit() async {
    super.onInit();

    await _setupConfig();

    update();
  }

  void onValueTap(
      BuildContext context, double currentValue, String label) async {
    // Mostrar el diálogo y esperar el resultado
    final result = await showDialog<List<dynamic>>(
      context: context,
      builder: (context) => ChangeConfigDialog(
        currentValue: currentValue,
        label: label,
      ),
    );

    // Verificar si result es nulo o si el valor no cambió
    if (result == null || result[0] == currentValue) {
      return; // Salir si no hay cambio
    }

    double updatedValue = result[0]; // Valor actualizado

    // Actualizar el valor correspondiente según el label
    if (label == 'TemperaturaMax') {
      temperatureMax.value = updatedValue;
      print('Updated temperatureMax: $updatedValue');
      print(temperatureMax.value);
    } else if (label == 'TemperaturaMin') {
      temperatureMin.value = updatedValue;
    } else if (label == 'HumedadMax') {
      humidityMax.value = updatedValue;
    } else if (label == 'HumedadMin') {
      humidityMin.value = updatedValue;
    } else if (label == 'LuzMax') {
      lightMax.value = updatedValue;
    } else if (label == 'LuzMin') {
      lightMin.value = updatedValue;
    }

    update();

    final updatedConfig = FlowerpotConfigs(
      smartpotId: flowerPot.id,
      temperatureMax: temperatureMax.value,
      temperatureMin: temperatureMin.value,
      humidityMax: humidityMax.value,
      humidityMin: humidityMin.value,
      lightMax: lightMax.value,
      lightMin: lightMin.value,
      notificationsEnabled: notificationsEnabled.value,
    );

    await updateConfigToServer(updatedConfig);
  }

  Future<void> updateConfigToServer(FlowerpotConfigs configs) async {
    final dio = HttpDioRequests();
    await dio.initialize();

    final response = await dio.updateSmartpotConfigurations(
      flowerPot.id.toString(),
      configs,
    );

    config = response;
    print('Updated configuration: ${response.temperatureMax}');
    update();
  }

  Future<void> _setupConfig() async {
    final dio = HttpDioRequests();
    await dio.initialize();
    final response = await dio.getSmartpotConfig(flowerPot.id.toString());

    // Actualizar los valores locales con la configuración obtenida del servidor
    temperatureMax.value = response.temperatureMax;
    temperatureMin.value = response.temperatureMin;
    humidityMax.value = response.humidityMax;
    humidityMin.value = response.humidityMin;
    lightMax.value = response.lightMax;
    lightMin.value = response.lightMin;
    notificationsEnabled.value = response.notificationsEnabled;

    update(); // Actualizar la UI si es necesario
  }

  void toggleNotifications(BuildContext context, bool value) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Confirmación',
              textAlign: TextAlign.center,
            ),
            content: Text(
              value
                  ? '¿Quieres habilitar las notificaciones?'
                  : '¿Quieres deshabilitar las notificaciones?',
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  notificationsEnabled.value = value;
                  update();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }
}
