import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/user_flowerpot_model.dart';
import 'package:maceta_inteligente/screens/PantallaDetallesMaceta/state.dart';
import 'package:maceta_inteligente/widgets/common_scaffold.dart';

class FlowerpotDetailsScreen extends StatelessWidget {
  final MyFlowerpotOperationalModel flowerPot;

  const FlowerpotDetailsScreen({super.key, required this.flowerPot});

  Widget _potCard(BuildContext context, FlowerpotDetailsState state) {
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
                    flowerPot.potName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      flowerPot.status.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: flowerPot.status.color.withOpacity(0.8),
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
              const SizedBox(height: 8),
              Text(
                'Última actualización: ${flowerPot.lastUpdated}',
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

  Widget _sensorCards(BuildContext context, FlowerpotDetailsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
    );
  }

  Widget _recommendations(BuildContext context, FlowerpotDetailsState state) {
    // Verifica si hay cuidados para mostrar
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
                  leading: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text(
                    rec,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerpotDetailsState>(
      init: FlowerpotDetailsState(flowerPot: flowerPot),
      builder: (state) => CommonScaffold(
        showFloatingButton: true,
        onTapFloatingButton: () => state.onTapFloatingButton(context),
        sliversChildren: [
          SliverToBoxAdapter(child: _potCard(context, state)),
          SliverToBoxAdapter(
            child: _sensorCards(context, state),
          ),
          SliverToBoxAdapter(child: _recommendations(context, state))
        ],
      ),
    );
  }
}
