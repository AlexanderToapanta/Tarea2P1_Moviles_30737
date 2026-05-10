import 'package:flutter/material.dart';
import '../atomos/textoResultado.dart';

class ResumenFactura extends StatelessWidget {
  final Map<String, dynamic> resumen;

ResumenFactura({super.key, required this.resumen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin:EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resumen de Factura",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ResultText(text: "Subtotal: \$${resumen['subtotal'].toStringAsFixed(2)}"),
            if (resumen['aplicaDescuento'])
              Text(
                "Descuento (${resumen['porcentajeDescuento']}%): -\$${resumen['montoDescuento'].toStringAsFixed(2)}",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ResultText(text: "Base Imponible: \$${resumen['baseImponible'].toStringAsFixed(2)}"),
            ResultText(text: "IVA (${resumen['ivaPorcentaje']}%): \$${resumen['iva'].toStringAsFixed(2)}"),
            Divider(),
            Text(
              "TOTAL A PAGAR: \$${resumen['total'].toStringAsFixed(2)}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 10),
            Divider(),
            Text(
              "Información del Vendedor",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ResultText(text: "Comisión (5%): \$${resumen['comisionVendedor'].toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
