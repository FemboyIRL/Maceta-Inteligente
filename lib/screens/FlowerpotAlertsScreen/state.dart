import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';

class FlowerpotAlertsState extends GetxController {
  late final MyFlowerpotOperationalModel flowerPot;
  FlowerpotAlertsState({required this.flowerPot});
  List<FlowerpotAlert> flowerpotAlerts = [
    FlowerpotAlert(
      id: 1,
      dangerLevel: DangerLevel.low,
      message: "La maceta está bien regada.",
      date: DateTime.now().subtract(Duration(minutes: 30)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 2,
      dangerLevel: DangerLevel.medium,
      message: "Humedad baja, por favor revise el riego.",
      date: DateTime.now().subtract(Duration(hours: 1)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 3,
      dangerLevel: DangerLevel.high,
      message: "¡Alerta! La maceta se está sobrecalentando.",
      date: DateTime.now().subtract(Duration(hours: 2)),
      isActive: false,
    ),
    FlowerpotAlert(
      id: 4,
      dangerLevel: DangerLevel.low,
      message: "Temperatura normal en la maceta.",
      date: DateTime.now().subtract(Duration(minutes: 15)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 5,
      dangerLevel: DangerLevel.medium,
      message: "Luz insuficiente, la maceta necesita más sol.",
      date: DateTime.now().subtract(Duration(hours: 3)),
      isActive: false,
    ),
    FlowerpotAlert(
      id: 6,
      dangerLevel: DangerLevel.high,
      message: "¡Atención! La planta ha estado sin agua durante mucho tiempo.",
      date: DateTime.now().subtract(Duration(days: 1)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 7,
      dangerLevel: DangerLevel.medium,
      message: "La humedad en la maceta es normal, pero puede mejorar.",
      date: DateTime.now().subtract(Duration(minutes: 45)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 8,
      dangerLevel: DangerLevel.low,
      message: "Todo en orden, la maceta está saludable.",
      date: DateTime.now().subtract(Duration(minutes: 10)),
      isActive: true,
    ),
    FlowerpotAlert(
      id: 9,
      dangerLevel: DangerLevel.high,
      message: "¡Urgente! La maceta está completamente seca.",
      date: DateTime.now().subtract(Duration(hours: 5)),
      isActive: false,
    ),
    FlowerpotAlert(
      id: 10,
      dangerLevel: DangerLevel.low,
      message: "Humedad perfecta para la maceta.",
      date: DateTime.now().subtract(Duration(minutes: 20)),
      isActive: true,
    ),
  ];
}
