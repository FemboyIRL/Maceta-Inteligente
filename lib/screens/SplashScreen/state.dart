import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/LoginScreen/screen.dart';
import 'package:maceta_inteligente/screens/PresentationWizardScreen/screen.dart';
import 'package:maceta_inteligente/utilities/data_stored/wizard_presentation_data.dart';


class SplashState extends GetxController {
  final BuildContext context;

  SplashState({required this.context});

  bool isLoading = true;
  bool hasSeenWizard = false;

  bool _canGoForward() => !isLoading && hasSeenWizard;

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
    Geolocator.requestPermission();
    if (!context.mounted) return;
    if (_canGoForward()) onTapStart();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;
      hasSeenWizard = await WizardPresentationData.hasSeenWizard();
      isLoading = false;
    } catch (error) {
      //nothing for now
    }
    refresh();
  }

  void onTapStart() {
    final Widget page = (_canGoForward())
        ? const LoginScreen()
        : const PresentationWizardScreen();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}