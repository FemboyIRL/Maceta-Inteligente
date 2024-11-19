import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/SplashScreen/state.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';
import 'package:maceta_inteligente/utilities/methods/colors_methods.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget _helloWidget() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text("Hola, esto es",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));
  }

  Widget _brandWidget() {
    return Center(
        child: Image.asset(AssetsResources.brandIcon, height: 180, width: 180));
  }

  Widget _subTitleWidget() {
    return const Center(
        child: SizedBox(
            width: 220,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("El jardín del mañana, hoy en tu mano",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13)))));
  }

  Widget _loadingWidget() {
    return const Center(
        child: SizedBox.square(
            dimension: 100, child: CircularProgressIndicator(strokeWidth: 7)));
  }

  Widget _firstTimeWidget(final BuildContext context, final SplashState state) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final contentColor =
        ColorsMethods.getItemsColorByBackground(backgroundColor);
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: state.onTapStart, child: const Text("Empezar"))),
          const SizedBox(height: 10),
          Center(
              child: Card(
                  color: backgroundColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text("Bienvenido",
                          style: TextStyle(
                              color: contentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)))))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashState>(
        init: SplashState(context: context),
        builder: (state) => Scaffold(
                body: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        _helloWidget(),
                        _brandWidget(),
                        _subTitleWidget(),
                        if (state.isLoading)
                          _loadingWidget()
                        else
                          _firstTimeWidget(context, state)
                      ])),
                ]))));
  }
}
