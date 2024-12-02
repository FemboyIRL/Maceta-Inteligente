import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/FlowerpotAlertsScreen/state.dart';
import 'package:maceta_inteligente/widgets/flowerpot_alert_widget.dart';

class FlowerpotAlertsScreen extends StatelessWidget {
  final Smartpot flowerPot;
  const FlowerpotAlertsScreen({super.key, required this.flowerPot});

  Widget _alerts(BuildContext context, FlowerpotAlertsState state) {
    if (state.flowerpotAlerts.isEmpty) {
      return const Column(
        children: [
          Center(child: Text("No hay alertas")),
        ],
      );
    }

    return ListView.builder(
      itemCount: state.flowerpotAlerts.length,
      itemBuilder: (context, index) {
        return FlowerpotAlertWidget(
          alert: state.flowerpotAlerts[index],
          onTapDelete: () =>
              state.handleDelete(state.flowerpotAlerts[index].id),
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
                  Expanded(
                    child: _alerts(context, state),
                  ),
                ],
              ),
            ));
  }
}
