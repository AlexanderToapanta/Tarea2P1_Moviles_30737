import 'package:flutter/material.dart';
import '../atomos/inputTexto.dart';
import '../atomos/inputNumero.dart';
import '../atomos/inputDecimal.dart';
import '../atomos/botonPrimario.dart';

class FormularioProducto extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController cantidadController;
  final TextEditingController precioController;
  final VoidCallback onAgregar;

 FormularioProducto({
    super.key,
    required this.nombreController,
    required this.cantidadController,
    required this.precioController,
    required this.onAgregar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTexto(text: "Nombre del Producto", controller: nombreController),
       SizedBox(height: 10),
        InputNumber(text: "Cantidad", controller: cantidadController),
       SizedBox(height: 10),
        InputDecimal(text: "Precio Unitario", controller: precioController),
       SizedBox(height: 20),
        PrimaryButton(text: "Agregar Producto", onPressed: onAgregar),
      ],
    );
  }
}
