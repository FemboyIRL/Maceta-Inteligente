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
    final screenWidth = MediaQuery.of(context).size.width;

    const cardMaxWidth = 90.0;
    final crossAxisCount = (screenWidth / cardMaxWidth).floor();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: sensors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 1.0,
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
