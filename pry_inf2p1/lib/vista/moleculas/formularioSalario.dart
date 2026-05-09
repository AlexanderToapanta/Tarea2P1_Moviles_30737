import 'package:flutter/material.dart';
import '../atomos/inputNumero.dart';
import '../atomos/texto.dart';

class FormularioSalario extends StatelessWidget {
  final String titulo;
  final String labelSalario;
  final String labelAnios;
  final TextEditingController controllerSalario;
  final TextEditingController controllerAnios;

  const FormularioSalario({
    super.key,
    required this.titulo,
    required this.labelSalario,
    required this.labelAnios,
    required this.controllerSalario,
    required this.controllerAnios,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(text: titulo),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: InputNumber(text: labelSalario, controller: controllerSalario)),
            const SizedBox(width: 10),
            Expanded(child: InputNumber(text: labelAnios, controller: controllerAnios)),
          ],
        ),
      ],
    );
  }
}
