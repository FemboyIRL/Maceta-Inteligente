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
      eventType: EventType.lowRisk,
      message: 'La planta tiene un crecimiento óptimo.',
      date: DateTime.now().subtract(const Duration(days: 1)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 2,
      eventType: EventType.mediumRisk,
      message: 'La planta necesita más luz solar.',
      date: DateTime.now().subtract(const Duration(days: 2)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 3,
      eventType: EventType.highRisk,
      message: '¡Riesgo alto! La planta muestra signos de estrés.',
      date: DateTime.now().subtract(const Duration(days: 3)),
      isActive: false,
    ),
    FlowerpotAlert(
      id: 4,
      eventType: EventType.waterEvent,
      message: 'Es momento de regar la planta.',
      date: DateTime.now().subtract(const Duration(hours: 12)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 6,
      eventType: EventType.highRisk,
      message: '¡Peligro! La planta necesita atención urgente.',
      date: DateTime.now().subtract(const Duration(hours: 6)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 7,
      eventType: EventType.lowRisk,
      message: 'La planta está en buenas condiciones.',
      date: DateTime.now().subtract(const Duration(days: 1)),
      isActive: false,
    ),
  ];
}
