import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';
import 'package:maceta_inteligente/screens/PantallaGraficasSensores/state.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';
import 'package:maceta_inteligente/widgets/sensor_data_chart_widget.dart';

class SensorDataScreen extends StatelessWidget {
  final MyFlowerpotOperationalModel flowerPot;

  const SensorDataScreen({super.key, required this.flowerPot});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SensorDataState>(
        init: SensorDataState(flowerPot: flowerPot),
        builder: (state) => CommonScaffold(sliversChildren: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SensorDataChart(
                    sensorData: state.flowerPotSensors,
                  ),
                ),
              )
            ]));
  }
}
