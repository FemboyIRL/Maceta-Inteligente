import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/FlowerpotAlertsScreen/state.dart';
import 'package:maceta_inteligente/widgets/flowerpot_alert_widget.dart';

class FlowerpotAlertsScreen extends StatelessWidget {
  final Smartpot flowerPot;
  const FlowerpotAlertsScreen({super.key, required this.flowerPot});

  Widget _alerts(BuildContext context, FlowerpotAlertsState state) {
    return ListView.builder(
      itemCount: state.flowerpotAlerts.length,
      itemBuilder: (context, index) {
        return FlowerpotAlertWidget(
          alert: state.flowerpotAlerts[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerpotAlertsState>(
        init: FlowerpotAlertsState(flowerPot: flowerPot),
        builder: (state) => Scaffold(
              body: Column(
                children: [
                  // Aquí puedes agregar más widgets si es necesario
                  Expanded(
                    child: _alerts(context,
                        state), // El ListView ocupará el espacio restante
                  ),
                ],
              ),
            ));
  }
}
