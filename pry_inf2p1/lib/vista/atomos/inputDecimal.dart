import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Permitir campo vacío
    if (text.isEmpty) {
      return newValue;
    }

    // Validar que solo contenga dígitos y un punto
    if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
      return oldValue;
    }

    // Validar que haya máximo un punto
    if (text.split('.').length > 2) {
      return oldValue;
    }

    // Validar que haya máximo 2 decimales
    if (text.contains('.')) {
      final parts = text.split('.');
      if (parts[1].length > 2) {
        return oldValue;
      }
    }

    return newValue;
  }
}

class InputDecimal extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const InputDecimal({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        DecimalFormatter(),
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: text,
      ),
    );
  }
}