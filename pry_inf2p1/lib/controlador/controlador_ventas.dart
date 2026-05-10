import '../modelo/modelo_ventas.dart';

class VentaController {
  String? validarCampoVacio(String? valor, String nombreCampo) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El $nombreCampo no puede estar vacío';
    }
    return null;
  }

  String? validarCantidad(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'La cantidad no puede estar vacía';
    }
    final int? cantidad = int.tryParse(valor);
    if (cantidad == null) {
      return 'Ingrese un número válido';
    }
    if (cantidad <= 0) {
      return 'La cantidad debe ser mayor a 0';
    }
    if (cantidad > 1000) {
      return 'La cantidad no puede superar 1000';
    }
    return null;
  }

  String? validarPrecio(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El precio no puede estar vacío';
    }
    final double? precio = double.tryParse(valor);
    if (precio == null) {
      return 'Ingrese un precio válido';
    }
    if (precio <= 0) {
      return 'El precio debe ser mayor a 0';
    }
    if (precio > 100000) {
      return 'El precio no puede superar 100,000';
    }
    return null;
  }

  String? validarListaProductos(List<Producto> productos) {
    if (productos.isEmpty) {
      return 'Debe agregar al menos un producto';
    }
    return null;
  }
}