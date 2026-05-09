import '../modelo/modelo_articulo.dart';

class ControladorArticulos {
  final List<ArticuloPromocion> _articulos = [];
  int _nextId = 1;

  List<ArticuloPromocion> get articulos => List.unmodifiable(_articulos);

  double _redondear(double valor) {
    return (valor * 100).roundToDouble() / 100;
  }

  void agregarArticulo({
    required String nombre,
    required double precio,
  }) {
    _articulos.add(
      ArticuloPromocion(
        id: _nextId++,
        nombre: nombre,
        precio: _redondear(precio),
      ),
    );
  }

  bool actualizarArticulo({
    required int id,
    required String nombre,
    required double precio,
    required int cantidad,
  }) {
    final index = _articulos.indexWhere((articulo) => articulo.id == id);
    if (index == -1) {
      return false;
    }

    _articulos[index]
      ..nombre = nombre
      ..precio = _redondear(precio)
      ..cantidad = cantidad;

    return true;
  }

  bool eliminarArticulo(int id) {
    final cantidadInicial = _articulos.length;
    _articulos.removeWhere((articulo) => articulo.id == id);
    return _articulos.length < cantidadInicial;
  }

  double get totalDescuento {
    return _redondear(_articulos.fold(0, (sum, articulo) => sum + articulo.descuentoTotal));
  }

  double get totalPagar {
    return _redondear(_articulos.fold(0, (sum, articulo) => sum + articulo.totalConDescuento));
  }
}