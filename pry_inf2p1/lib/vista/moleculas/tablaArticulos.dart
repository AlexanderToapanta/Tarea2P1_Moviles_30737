import 'package:flutter/material.dart';

import '../../modelo/modelo_articulo.dart';

class TablaArticulos extends StatelessWidget {
  final List<ArticuloPromocion> articulos;
  final void Function(ArticuloPromocion articulo) onEditar;
  final void Function(int id) onEliminar;

  const TablaArticulos({
    super.key,
    required this.articulos,
    required this.onEditar,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    if (articulos.isEmpty) {
      return const Center(child: Text('No hay articulos agregados.'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Producto')),
            DataColumn(label: Text('Precio')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('% Desc')),
            DataColumn(label: Text('Descuento')),
            DataColumn(label: Text('Total')),
            DataColumn(label: Text('Acciones')),
          ],
          rows: articulos
              .map(
                (articulo) => DataRow(
                  cells: [
                    DataCell(Text(articulo.nombre)),
                    DataCell(Text(articulo.precio.toStringAsFixed(2))),
                    DataCell(Text(articulo.cantidad.toString())),
                    DataCell(Text('${(articulo.porcentajeDescuento * 100).toStringAsFixed(0)}%')),
                    DataCell(Text(articulo.descuentoTotal.toStringAsFixed(2))),
                    DataCell(Text(articulo.totalConDescuento.toStringAsFixed(2))),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            tooltip: 'Editar',
                            onPressed: () => onEditar(articulo),
                            icon: const Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            tooltip: 'Eliminar',
                            onPressed: () => onEliminar(articulo.id),
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}