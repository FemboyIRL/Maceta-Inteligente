import 'package:flutter/material.dart';
import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';
import 'package:maceta_inteligente/screens/FlowerPotScreen/screen.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';

class MyFlowerpotWidget extends StatelessWidget {
  final MyFlowerpotOperationalModel flowerPot;

  const MyFlowerpotWidget({super.key, required this.flowerPot});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: flowerPot.plantName,
      child: SizedBox(
        width: 150,
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FlowerpotScreen(
                    flowerPot: flowerPot,
                  ))),
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
                  Stack(
                    children: [
                      Image.asset(
                        AssetsResources.flowerPot,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: flowerPot.status.color.withOpacity(0.8),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
        ),
      ),
    );
  }
}
