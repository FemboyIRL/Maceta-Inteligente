import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/FlowerpotConfigScreen/state.dart';
import 'package:maceta_inteligente/widgets/config_range_widget.dart';

class FlowerpotConfigScreen extends StatelessWidget {
  final Smartpot flowerPot;

  const FlowerpotConfigScreen({super.key, required this.flowerPot});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerpotConfigState>(
      init: FlowerpotConfigState(flowerPot: flowerPot),
      builder: (state) {
        List<Map<String, dynamic>> configurations = [
          {
            'label': 'Temperatura',
            'min': state.temperatureMin.value,
            'max': state.temperatureMax.value,
            'current':
                (state.temperatureMax.value + state.temperatureMin.value) / 2,
          },
          {
            'label': 'Humedad',
            'min': state.humidityMin.value,
            'max': state.humidityMax.value,
            'current': (state.humidityMax.value + state.humidityMin.value) / 2,
          },
          {
            'label': 'Luz',
            'min': state.lightMin.value,
            'max': state.lightMax.value,
            'current': (state.lightMax.value + state.lightMin.value) / 2,
          },
          {
            'label': 'Notificaciones',
            'min': null,
            'max': null,
            'current': state.notificationsEnabled.value ? 1 : 0,
          }
        ];

        return Scaffold(
          body: ListView.builder(
            itemCount: configurations.length,
            itemBuilder: (context, index) {
              var config = configurations[index];

              if (config['label'] == 'Notificaciones') {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Notificaciones',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                            value: state.notificationsEnabled.value,
                            onChanged: (value) {
                              state.toggleNotifications(context, value);
                            },
                            activeColor: Colors.green,
                            inactiveTrackColor: Colors.green.withOpacity(0.4),
                            inactiveThumbColor: Colors.green.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return ConfigRangeDisplay(
                label: config['label'],
                minValue: config['min'],
                maxValue: config['max'],
                currentValue: config['current'],
                onMaxValueTap: (context, value, label) =>
                    state.onValueTap(context, value, "${label}Max"),
                onMinValueTap: (context, value, label) =>
                    state.onValueTap(context, value, "${label}Min"),
              );
            },
          ),
        );
      },
    );
  }
}
