import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/alert_event_type_enum.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';

class FlowerpotAlertsState extends GetxController {
  late final Smartpot flowerPot;
  FlowerpotAlertsState({required this.flowerPot});

  List<FlowerpotAlert> flowerpotAlerts = [
    FlowerpotAlert(
      id: 1,
      alertType: EventType.highRisk,
      alertContent: "Riesgo de sobrecalentamiento detectado",
      createTime: DateTime.parse("2024-11-21T10:00:00"),
      smartpot: 1,
    ),
    FlowerpotAlert(
      id: 2,
      alertType: EventType.lowRisk,
      alertContent: "Nivel de agua ligeramente bajo",
      createTime: DateTime.parse("2024-11-21T12:30:00"),
      smartpot: 2,
    ),
    FlowerpotAlert(
      id: 3,
      alertType: EventType.mediumRisk,
      alertContent: "Condiciones del suelo inadecuadas",
      createTime: DateTime.parse("2024-11-21T15:00:00"),
      smartpot: 3,
    ),
    FlowerpotAlert(
      id: 4,
      alertType: EventType.waterEvent,
      alertContent: "Evento de riego automático completado",
      createTime: DateTime.parse("2024-11-21T18:00:00"),
      smartpot: 4,
    ),
    FlowerpotAlert(
      id: 5,
      alertType: EventType.highRisk,
      alertContent: "Temperatura ambiente peligrosa",
      createTime: DateTime.parse("2024-11-21T20:00:00"),
      smartpot: 5,
    ),
  ];
}
