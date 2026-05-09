import 'package:flutter/material.dart';
import 'formularioSalario.dart';
import 'botonResultado.dart';

class SalarioInput extends StatelessWidget {
  final String text1 = "Ingrese su salario base y los años que lleva trabajando";
  final String text2 = "Años";
  final String text3 = "Salario Base";
  final String botton = "Calcular";
  final String textResultado = "Su salario es";
  
  final VoidCallback onPressed;
  final TextEditingController controller1, controller2;

  const SalarioInput({
    super.key, 
    required this.onPressed, 
    required this.controller1, 
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FormularioSalario(
            titulo: text1,
            labelSalario: text3,
            labelAnios: text2,
            controllerSalario: controller1,
            controllerAnios: controller2,
          ),
          const SizedBox(height: 20),
          BotonResultado(
            textoBoton: botton,
            textoResultado: textResultado,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
