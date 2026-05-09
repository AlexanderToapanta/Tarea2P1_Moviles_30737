class ArticuloPromocion {
  final int id;
  String nombre;
  double precio;
  int cantidad;

  ArticuloPromocion({
    required this.id,
    required this.nombre,
    required this.precio,
    this.cantidad = 1,
  });

  double get porcentajeDescuento {
    if (precio >= 200) {
      return 0.15;
    }
    if (precio > 100 && precio < 200) {
      return 0.12;
    }
    return 0.10;
  }

  double _redondear(double valor) {
    return (valor * 100).roundToDouble() / 100;
  }

  double get descuentoUnitario => _redondear(precio * porcentajeDescuento);

  double get descuentoTotal => _redondear(descuentoUnitario * cantidad);

  double get subtotal => _redondear(precio * cantidad);

  double get totalConDescuento => _redondear(subtotal - descuentoTotal);
}