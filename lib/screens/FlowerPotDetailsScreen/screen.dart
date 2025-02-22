import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/models/flower_status_enum.dart';
import 'package:maceta_inteligente/models/smartpot/server_model/server.dart';
import 'package:maceta_inteligente/screens/FlowerPotDetailsScreen/state.dart';
import 'package:maceta_inteligente/utilities/methods/global_methods.dart';
import 'package:maceta_inteligente/widgets/sensor_card.dart';

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
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Recomendaciones",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
                'Planta: ${state.flowerPot.plant!.plantName}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'Última actualización: ${GlobalMethods.formatWeatherDate(state.flowerPot.updatedAt)}',
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

  Widget _sensorCards(BuildContext context, FlowerPotDetailsState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sensores actualizados",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(state.sensorCards.length, (index) {
              final sensorCard = state.sensorCards[index];
              return SensorCardWidget(operation: sensorCard);
            }),
          ),
        ],
      ),
    );
  }

  // Widget para las recomendaciones
  Widget _recommendations(BuildContext context, FlowerPotDetailsState state) {
    if (state.flowerPot.plant!.plantCares.isEmpty) {
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
          ...state.flowerPot.plant!.plantCares.map((rec) => Card(
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
