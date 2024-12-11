import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/utilities/methods/Dio/http_dio_requests.dart';

class FlowerpotAlertsState extends GetxController {
  late final Smartpot flowerPot;
  FlowerpotAlertsState({required this.flowerPot});

  List<FlowerpotAlert> flowerpotAlerts = [];

  @override
  void onInit() async {
    super.onInit();

    final dio = HttpDioRequests();

    await dio.initialize();

    flowerpotAlerts = await dio.getSmartpotAlerts(flowerPot.id.toString());

    update();
  }

  Future<void> handleDelete(int id) async {
    flowerpotAlerts.removeWhere((alert) => alert.id == id);
    update();
  }
}
