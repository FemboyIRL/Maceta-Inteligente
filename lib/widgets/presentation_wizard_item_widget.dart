import 'package:flutter/material.dart';
import 'package:maceta_inteligente/screens/PresentationWizardScreen/state.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';

class PresentationWizardItemWidget extends StatelessWidget {
  final PresentationWizardPageViewModel pageContent;

  const PresentationWizardItemWidget({super.key, required this.pageContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit
          .expand, // Esto asegura que los elementos se expandan a todo el tamaño disponible
      children: [
        if (pageContent.backgroundChild != null)
          // Añadimos el contenedor opaco sobre la imagen de fondo
          Stack(
            children: [
              // Imagen de fondo que cubre toda la pantalla con BoxFit.cover
              Positioned.fill(
                child: pageContent.backgroundChild!,
              ),
              // Container con opacidad para oscurecer la imagen de fondo
              Container(
                color: Colors.black.withOpacity(0.4), // Opacidad ajustable
              ),
            ],
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (pageContent.title != null)
                          Text(
                            pageContent.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Colors.white, // Texto blanco para que resalte
                              fontSize: 30,
                            ),
                          ),
                        Text(
                          pageContent.contentText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white, // Texto blanco
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.square(dimension: 65,child: pageContent.child),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
