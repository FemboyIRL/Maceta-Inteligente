import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LastCardAddWidget extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const LastCardAddWidget({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: const [6, 10, 6, 10],
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        color: Colors.black,
        strokeWidth: 2,
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                'Agregar $name',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, 
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
