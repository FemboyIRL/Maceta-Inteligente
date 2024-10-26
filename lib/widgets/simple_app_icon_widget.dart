import 'package:flutter/material.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';

class SimpleAppIconWidget extends StatelessWidget {
  const SimpleAppIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(AssetsResources.brandIcon,
                  height: 60, width: 60)),
          const Divider(height: 0)
        ]);
  }
}