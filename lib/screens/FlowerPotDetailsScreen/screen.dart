import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/FlowerPotDetailsScreen/state.dart';

class FlowerpotDetailsScreen extends StatelessWidget {
  final Smartpot flowerPot;
  const FlowerpotDetailsScreen({super.key, required this.flowerPot});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerPotDetailsState>(
        init: FlowerPotDetailsState(flowerPot: flowerPot),
        builder: (state) => Scaffold(
              body: ListView(
                children: [
                  _potCard(context, state), 
                  _sensorCards(context, state), 
                  _recommendations(context, state), 
                ],
              ),
            ));
  }

  // Widget para la tarjeta de la maceta
  Widget _potCard(BuildContext context, FlowerPotDetailsState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    state.flowerPot.potName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.flowerPot.status.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: state.flowerPot.status.color.withOpacity(0.8),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
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
                ],
              ),
              Text(
                'Planta: ${state.flowerPot.potName}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'Última actualización: ${state.flowerPot.updatedAt}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey[300]),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para mostrar las tarjetas de los sensores
  Widget _sensorCard(
      {required IconData icon,
      required String label,
      required String value,
      required Color color}) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(icon, size: 24, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget que construye las tarjetas de los sensores
  Widget _sensorCards(BuildContext context, FlowerPotDetailsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () => state.onTapSensors(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sensores",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sensorCard(
                  icon: Icons.water_drop,
                  label: "Humedad",
                  value: "${state.lastRegisteredSensors.humidity}%",
                  color: Colors.blue,
                ),
                _sensorCard(
                  icon: Icons.thermostat,
                  label: "Temperatura",
                  value: "${state.lastRegisteredSensors.temperature}°C",
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sensorCard(
                  icon: Icons.light_mode,
                  label: "Luz",
                  value: "${state.lastRegisteredSensors.lightLevel} lux",
                  color: Colors.amber,
                ),
                _sensorCard(
                  icon: Icons.opacity,
                  label: "Agua",
                  value: "${state.lastRegisteredSensors.waterLevel}%",
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para las recomendaciones
  Widget _recommendations(BuildContext context, FlowerPotDetailsState state) {
    if (state.plant.plantCares.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "No hay recomendaciones disponibles.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recomendaciones",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...state.plant.plantCares.map((rec) => Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: rec.type == "positive"
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.error_sharp,
                          color: Colors.red,
                        ),
                  title: Text(
                    rec.recommendation,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
