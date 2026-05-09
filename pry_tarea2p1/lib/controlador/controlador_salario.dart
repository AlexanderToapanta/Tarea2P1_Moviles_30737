import '../modelo/modelo_salario.dart';
class ControllerPractica {

  String procesar(String anios, String salarioBase) {
    var texto = "El salario final y su historial es el siguiente: \n";
    final profesor = Profesor.calcularSalario(
        int.parse(anios), double.parse(salarioBase));

    for (var i = 0; i < profesor.historial.length; i++) {
      texto += "Año ${i + 1}: ${profesor.historial[i]}\n";
    }
    texto += "El salario final es: ${profesor.salario}\n";
    return texto;
  }
}