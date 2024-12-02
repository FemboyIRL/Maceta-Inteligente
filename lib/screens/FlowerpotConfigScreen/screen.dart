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
            'min': state.config.temperatureMin,
            'max': state.config.temperatureMax,
            'current':
                (state.config.temperatureMax + state.config.temperatureMin) / 2,
          },
          {
            'label': 'Humedad',
            'min': state.config.humidityMin,
            'max': state.config.humidityMax,
            'current':
                (state.config.humidityMax + state.config.humidityMin) / 2,
          },
          {
            'label': 'Luz',
            'min': state.config.lightMin,
            'max': state.config.lightMax,
            'current': (state.config.lightMax + state.config.lightMin) / 2,
          },
          {
            'label': 'Notificaciones',
            'min': null,
            'max': null,
            'current': state.config.notificationsEnabled ? 1 : 0,
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
              );
            },
          ),
        );
      },
    );
  }
}
