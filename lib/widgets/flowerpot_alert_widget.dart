import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maceta_inteligente/models/alert_event_type_enum.dart';
import 'package:maceta_inteligente/models/flowerpot_alerts/server_model/server_model.dart';

class FlowerpotAlertWidget extends StatelessWidget {
  final FlowerpotAlert alert;

  const FlowerpotAlertWidget({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = alert.alertType.getBackgroundColor();
    Color iconColor = alert.alertType.getIconColor();
    Color textColor = alert.alertType.getTextColor();

    String formattedDate =
        DateFormat('dd MMM yyyy, HH:mm').format(alert.createTime);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                alert.alertType.icon,
                color: iconColor,
                size: 50,
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
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      alert.alertContent,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fecha: $formattedDate',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textColor.withOpacity(0.7),
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
