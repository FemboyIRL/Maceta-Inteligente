import 'package:flutter/material.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';

class FlowerpotAlertWidget extends StatelessWidget {
  final FlowerpotAlert alert;

  const FlowerpotAlertWidget({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    // Definir los colores según el nivel de peligro
    Color backgroundColor;
    Color iconColor;
    Color textColor;

    // Asignar colores basados en el nivel de peligro
    switch (alert.dangerLevel) {
      case DangerLevel.low:
        backgroundColor = alert.isActive ? Colors.green[100]! : Colors.green[200]!;
        iconColor = alert.isActive ? Colors.green : Colors.green[700]!;
        textColor = alert.isActive ? Colors.black : Colors.white;
        break;
      case DangerLevel.medium:
        backgroundColor = alert.isActive ? Colors.orange[100]! : Colors.orange[200]!;
        iconColor = alert.isActive ? Colors.orange : Colors.orange[700]!;
        textColor = alert.isActive ? Colors.black : Colors.white;
        break;
      case DangerLevel.high:
        backgroundColor = alert.isActive ? Colors.red[100]! : Colors.red[200]!;
        iconColor = alert.isActive ? Colors.red : Colors.red[700]!;
        textColor = alert.isActive ? Colors.black : Colors.white;
        break;
      default:
        backgroundColor = alert.isActive ? Colors.green[100]! : Colors.red[100]!;
        iconColor = alert.isActive ? Colors.green : Colors.red;
        textColor = alert.isActive ? Colors.black : Colors.white;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 5, // Sombra para dar profundidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
        ),
        color: backgroundColor, // Color del fondo según nivel de peligro
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                alert.isActive
                    ? Icons.notifications_active
                    : Icons.notifications_off,
                color: iconColor, // Color del ícono según nivel de peligro
                size: 30,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alerta: ${alert.id}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor, // Color del texto según el estado
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      alert.message,
                      style: TextStyle(
                        fontSize: 14,
                        color: alert.isActive
                            ? textColor
                            : Colors.white70, // Estilo según el estado
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fecha: ${alert.date.toLocal()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: alert.isActive
                            ? textColor
                            : Colors.white54, // Estilo según el estado
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
