class Profesor{
  static const double incremento= 0.10;
  double salario;
  List<double> historial;
  Profesor({required this.salario, required this.historial});
  static Profesor calcularSalario(int anios, double salarioBase){
    var salario = salarioBase;
    List<double> historial = [];
    for (var i = 0; i < anios; i++) {
      salario = salario + (salario * incremento);
      historial.add(salario);
    }
    return Profesor(salario: salario, historial: historial);

  }


}