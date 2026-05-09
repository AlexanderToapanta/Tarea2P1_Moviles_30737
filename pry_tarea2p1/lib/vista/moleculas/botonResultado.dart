import 'package:flutter/material.dart';
import '../atomos/botonPrimario.dart';
import '../atomos/textoResultado.dart';

class BotonResultado extends StatelessWidget {
  final String textoBoton;
  final String textoResultado;
  final VoidCallback onPressed;

  const BotonResultado({
    super.key,
    required this.textoBoton,
    required this.textoResultado,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(text: textoBoton, onPressed: onPressed),
        const SizedBox(height: 20),
        ResultText(text: textoResultado),
      ],
    );
  }
}
