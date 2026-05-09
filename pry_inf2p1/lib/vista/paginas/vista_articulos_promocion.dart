import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controlador/controlador_articulos.dart';
import '../../modelo/modelo_articulo.dart';
import '../atomos/inputDecimal.dart';
import '../moleculas/tablaArticulos.dart';

class VistaArticulosPromocion extends StatefulWidget {
  const VistaArticulosPromocion({super.key});

  @override
  State<VistaArticulosPromocion> createState() =>
      _VistaArticulosPromocionState();
}

class _VistaArticulosPromocionState extends State<VistaArticulosPromocion> {
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _controlador = ControladorArticulos();

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _agregarArticulo() {
    final nombre = _nombreController.text.trim();
    final precioTexto = _precioController.text.trim();
    final precio = double.tryParse(precioTexto);

    if (nombre.isEmpty) {
      _mostrarMensaje('Ingrese el nombre del producto.');
      return;
    }

    if (precio == null || precio <= 0) {
      _mostrarMensaje('Ingrese un precio valido mayor a 0.');
      return;
    }

    setState(() {
      _controlador.agregarArticulo(nombre: nombre, precio: precio);
      _nombreController.clear();
      _precioController.clear();
    });
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(mensaje)));
  }

  Future<void> _editarArticulo(ArticuloPromocion articulo) async {
    final nombreController = TextEditingController(text: articulo.nombre);
    final precioController = TextEditingController(
      text: articulo.precio.toStringAsFixed(2),
    );
    final cantidadController = TextEditingController(
      text: articulo.cantidad.toString(),
    );

    final actualizado = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar articulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: precioController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  DecimalFormatter(),
                ],
                decoration: const InputDecoration(labelText: 'Precio'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cantidadController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Cantidad'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final nombre = nombreController.text.trim();
                final precio = double.tryParse(precioController.text.trim());
                final cantidad = int.tryParse(cantidadController.text.trim());

                if (nombre.isEmpty ||
                    precio == null ||
                    precio <= 0 ||
                    cantidad == null ||
                    cantidad <= 0) {
                  _mostrarMensaje(
                    'Datos invalidos. Revise nombre, precio y cantidad.',
                  );
                  return;
                }

                Navigator.pop(context, true);
                setState(() {
                  _controlador.actualizarArticulo(
                    id: articulo.id,
                    nombre: nombre,
                    precio: precio,
                    cantidad: cantidad,
                  );
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );

    nombreController.dispose();
    precioController.dispose();
    cantidadController.dispose();

    if (actualizado == true) {
      _mostrarMensaje('Articulo actualizado correctamente.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final articulos = _controlador.articulos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4.2 - Articulos con promocion'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del producto',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputDecimal(text: 'Precio', controller: _precioController),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _agregarArticulo,
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TablaArticulos(
                articulos: articulos,
                onEditar: _editarArticulo,
                onEliminar: (id) {
                  setState(() {
                    _controlador.eliminarArticulo(id);
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descuento total: ${_controlador.totalDescuento.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Total a pagar: ${_controlador.totalPagar.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
