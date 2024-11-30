import 'package:flutter/material.dart';
import 'package:maceta_inteligente/models/sensor_card_operational_model.dart';

class SensorNavigationWidget extends StatelessWidget {
  final List<SensorCardOperationalModel> sensors;
  final Function(SensorCardOperationalModel) onTap;

  const SensorNavigationWidget({
    super.key,
    required this.sensors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    // Reducir el ancho máximo de las Cards para hacerlas más pequeñas
    const cardMaxWidth = 90.0; // Máximo ancho de cada card
    final crossAxisCount = (screenWidth / cardMaxWidth).floor();

    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Desactiva el scroll interno
      shrinkWrap: true, // Ajusta el tamaño al contenido
      itemCount: sensors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 6.0, // Espacio horizontal entre columnas
        mainAxisSpacing: 6.0, // Espacio vertical entre filas
        childAspectRatio: 1.0, // Proporción ancho:alto de cada card
      ),
      itemBuilder: (context, index) {
        final sensor = sensors[index];
        return GestureDetector(
          onTap: () => onTap(sensor),
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(sensor.icon, size: 24, color: sensor.color),
                  const SizedBox(height: 6),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    sensor.label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sensor.value,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
