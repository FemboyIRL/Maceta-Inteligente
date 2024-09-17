import 'package:flutter/material.dart';
import 'package:maceta_inteligente/models/plant_data/server/server_model.dart';

class PlantaCatalogoWidget extends StatelessWidget {
  final Plant planta;

  const PlantaCatalogoWidget({super.key, required this.planta});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, 
      margin: const EdgeInsets.all(
          4.0), 
      child: Card(
        elevation: 25,
        child: Padding(
          padding: const EdgeInsets.all(
              4.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planta.nombreComun,
                style: const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4), 
              planta.imagenPredeterminada.urlRegular.isNotEmpty
                  ? SizedBox(
                      child: Image.network(
                        planta.imagenPredeterminada.urlRegular,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 4), // Reduce el espacio entre elementos
              Text(
                "Ciclo: ${planta.ciclo}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4), 
              Text(
                "Cantidad de Riego: ${planta.cantidadRiego}",
                style: const TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
