import 'package:flutter/material.dart';

class ContrastBrandWidget extends StatelessWidget {
  const ContrastBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("GrowSmart ${DateTime.now().year}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 9, color: Colors.white))));
  }
}