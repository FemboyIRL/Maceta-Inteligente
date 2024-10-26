import 'package:flutter/material.dart';
import 'package:maceta_inteligente/screens/PantallaMenuPrincipal/state.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';

class MyFlowerpotWidget extends StatelessWidget {
  final MyFlowerpotModel flowerPot;

  const MyFlowerpotWidget({super.key, required this.flowerPot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Imagen de la planta
              Image.asset(
                AssetsResources.flowerPot,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),

              Text(
                flowerPot.potName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Última actualización: ${flowerPot.lastUpdated}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
