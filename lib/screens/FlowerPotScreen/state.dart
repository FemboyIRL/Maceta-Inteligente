import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/SensorChartsScreen/screen.dart';

class FlowerpotState extends GetxController {
  late final Smartpot flowerPot;
  FlowerpotState({required this.flowerPot});
  var selectedCardIndex = 0.obs;
  List<NavigationPanelOperationalModel> navigationCards = [];
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    _setUpNavigationCards();
  }

  void onPageChanged(int index) {
    selectedCardIndex.value = index;
  }

  _setUpNavigationCards() {
    navigationCards = [
      NavigationPanelOperationalModel(
        title: flowerPot.potName,
        icon: Icons.local_florist,
        onTap: () => selectedCardIndex.value = 0,
      ),
      NavigationPanelOperationalModel(
        title: "Alertas",
        icon: Icons.notifications,
        onTap: () => selectedCardIndex.value = 1,
      ),
      NavigationPanelOperationalModel(
        title: "Configuración",
        icon: Icons.settings,
        onTap: () => selectedCardIndex.value = 2,
      ),
    ];
  }

  void onTapFloatingButton(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlowerpotConfigurations(flowerPot: flowerPot)));
  }

  void onTapSensors(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SensorDataScreen(flowerPot: flowerPot)));
  }
}

class NavigationPanelOperationalModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  NavigationPanelOperationalModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
