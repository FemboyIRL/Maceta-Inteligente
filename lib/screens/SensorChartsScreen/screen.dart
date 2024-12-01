import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';
import 'package:maceta_inteligente/screens/SensorChartsScreen/state.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';
import 'package:maceta_inteligente/widgets/sensor_data_chart_widget.dart';
import 'package:maceta_inteligente/widgets/sensor_navigation_widget.dart';

class SensorDataScreen extends StatelessWidget {
  final SensorCardOperationalModel sensor;

  const SensorDataScreen({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SensorDataState>(
      init: SensorDataState(selectedSensor: sensor),
      builder: (state) {
        return CommonScaffold(
          sliversChildren: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SensorNavigationWidget(
                      sensors: state.sensorCards,
                      onTap: (selectedSensor) {
                        state.updateSensor(selectedSensor);
                      },
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Historial de ${state.selectedSensor.label}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SensorLineChart(sensorData: state.selectedSensorHistory)
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
