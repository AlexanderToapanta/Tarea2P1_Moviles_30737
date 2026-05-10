
class Producto {
  String nombre;
  int cantidad;
  double precioUnitario;

  Producto({
    required this.nombre,
    required this.cantidad,
    required this.precioUnitario,
  });

  double subtotal() {
    return cantidad * precioUnitario;
  }
}

class VentaModel {
  List<Producto> productos;

  static const double ivaPorcentaje = 15.0;
  static const double umbralDescuento = 2000.0;
  static const double porcentajeDescuento = 20.0;
  static const double comisionVendedorPorcentaje = 5.0;

  VentaModel({required this.productos});

  double calcularSubtotal() {
    double subtotal = 0;

    for (var producto in productos) {
      subtotal += producto.subtotal();
    }

    return subtotal;
  }

  bool aplicaDescuento() {
    return calcularSubtotal() > umbralDescuento;
  }

  double calcularMontoDescuento() {
    if (aplicaDescuento()) {
      return calcularSubtotal() * (porcentajeDescuento / 100);
    }

    return 0;
  }

  double calcularBaseImponible() {
    return calcularSubtotal() - calcularMontoDescuento();
  }

  double calcularIVA() {
    return calcularBaseImponible() * (ivaPorcentaje / 100);
  }

  double calcularTotal() {
    return calcularBaseImponible() + calcularIVA();
  }

  double calcularComisionVendedor() {
    return calcularTotal() * (comisionVendedorPorcentaje / 100);
  }

  Map<String, dynamic> obtenerResumenFactura() {
    final subtotal = calcularSubtotal();
    final montoDescuento = calcularMontoDescuento();
    final baseImponible = calcularBaseImponible();
    final iva = calcularIVA();
    final total = calcularTotal();
    final comision = calcularComisionVendedor();

    return {
      'subtotal': subtotal,
      'aplicaDescuento': aplicaDescuento(),
      'porcentajeDescuento': porcentajeDescuento,
      'montoDescuento': montoDescuento,
      'baseImponible': baseImponible,
      'ivaPorcentaje': ivaPorcentaje,
      'iva': iva,
      'total': total,
      'comisionVendedor': comision,
      'productos': productos,
    };
  }
}