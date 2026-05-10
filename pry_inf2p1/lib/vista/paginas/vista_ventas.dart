import 'package:flutter/material.dart';
import '../../modelo/modelo_ventas.dart';
import '../../controlador/controlador_ventas.dart';
import '../moleculas/formularioProducto.dart';
import '../moleculas/listaProductos.dart';
import '../moleculas/resumenFactura.dart';
import '../atomos/botonVolver.dart';

class VistaVentas extends StatefulWidget {
 VistaVentas({super.key});

  @override
  State<VistaVentas> createState() => _VistaVentasState();
}

class _VistaVentasState extends State<VistaVentas> {
  final VentaController _controller = VentaController();
  final List<Producto> _productos = [];
  
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _cantidadCtrl = TextEditingController();
  final TextEditingController _precioCtrl = TextEditingController();

  void _agregarProducto() {
    final String nombre = _nombreCtrl.text;
    final String cantidadStr = _cantidadCtrl.text;
    final String precioStr = _precioCtrl.text;

    String? errorNombre = _controller.validarCampoVacio(nombre, "nombre");
    String? errorCantidad = _controller.validarCantidad(cantidadStr);
    String? errorPrecio = _controller.validarPrecio(precioStr);

    if (errorNombre != null || errorCantidad != null || errorPrecio != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorNombre ?? errorCantidad ?? errorPrecio ?? "Error en los datos")),
      );
      return;
    }

    setState(() {
      _productos.add(Producto(
        nombre: nombre,
        cantidad: int.parse(cantidadStr),
        precioUnitario: double.parse(precioStr),
      ));
      _nombreCtrl.clear();
      _cantidadCtrl.clear();
      _precioCtrl.clear();
    });
  }

  void _eliminarProducto(int index) {
    setState(() {
      _productos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ventaModel = VentaModel(productos: _productos);
    final resumen = ventaModel.obtenerResumenFactura();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de Ventas e IVA"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormularioProducto(
              nombreController: _nombreCtrl,
              cantidadController: _cantidadCtrl,
              precioController: _precioCtrl,
              onAgregar: _agregarProducto,
            ),
           SizedBox(height: 20),
           Text(
              "Productos Agregados:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           Divider(),
            ListaProductos(
              productos: _productos,
              onEliminar: _eliminarProducto,
            ),
            if (_productos.isNotEmpty) ...[
              ResumenFactura(resumen: resumen),
            ],
            SizedBox(height: 20),
            BotonVolver(),
          ],
        ),
      ),
    );
  }
}
