import 'package:flutter/material.dart';
import 'package:pry_tarea2p1/vista/moleculas/formularioSalario.dart';
import 'package:pry_tarea2p1/vista/moleculas/botonResultado.dart';
import '../atomos/botonVolver.dart';
import '../../controlador/controlador_salario.dart';

class VistaSalarioProfesor extends StatefulWidget {
  const VistaSalarioProfesor({super.key});
  @override
  State<VistaSalarioProfesor> createState() => _VistaSalarioProfesorState();
}

class _VistaSalarioProfesorState extends State<VistaSalarioProfesor> {
  final salarioBase = TextEditingController();
  final anios = TextEditingController();
  final controlador = ControllerPractica();
  String resultado = "Su salario es";

  void onPressed() {
    setState(() {
      resultado = controlador.procesar(anios.text, salarioBase.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salario Profesor"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FormularioSalario(
                  titulo: "Ingrese su salario base y los años que lleva trabajando",
                  labelSalario: "Salario Base",
                  labelAnios: "Años",
                  controllerSalario: salarioBase,
                  controllerAnios: anios,
                ),
                const SizedBox(height: 20),
                BotonResultado(
                  textoBoton: "Calcular",
                  textoResultado: resultado,
                  onPressed: onPressed,
                ),
                const SizedBox(height: 10),
                const BotonVolver(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
