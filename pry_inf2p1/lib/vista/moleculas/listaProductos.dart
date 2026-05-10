import 'package:flutter/material.dart';
import '../../modelo/modelo_ventas.dart';

class ListaProductos extends StatelessWidget {
  final List<Producto> productos;
  final Function(int) onEliminar;

  const ListaProductos({
    super.key,
    required this.productos,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return Text("No hay productos agregados.");
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final producto = productos[index];
        return ListTile(
          title: Text(producto.nombre),
          subtitle: Text("Cant: ${producto.cantidad} x \$${producto.precioUnitario.toStringAsFixed(2)}"),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => onEliminar(index),
          ),
        );
      },
    );
  }
}
