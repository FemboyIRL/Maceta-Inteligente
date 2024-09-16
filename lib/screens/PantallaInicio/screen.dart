import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/PantallaInicio/state.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  Widget _logo() {
    return Container(
      alignment: Alignment.center,
      child: Placeholder(
        child: SizedBox.square(
          dimension: 200,
        ),
      ),
      // child: Image.asset(
      //   '',
      //   height: 200,
      //   width: 200,
      //),
    );
  }

  Widget _options(EstadoCatalogo state, BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildSquare(
                    "Iniciar Sesión",
                    SvgPicture.asset('assets/svg/login.svg'),
                    state,
                    context,
                  ),
                  _buildSquare(
                    "Registrarse",
                    SvgPicture.asset('assets/svg/register.svg'),
                    state,
                    context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _buildSquare(
                    "Explorar Plantas",
                    SvgPicture.asset('assets/svg/plant.svg'),
                    state,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquare(
      String text, Widget icon, EstadoCatalogo state, BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => state.cambiarPantalla(text, context),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: FittedBox(fit: BoxFit.contain, child: icon),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstadoCatalogo>(
      init: EstadoCatalogo(),
      builder: (state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  const SizedBox(
                    height: 125,
                  ),
                  _options(state, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
