import 'package:flutter/material.dart';
import 'vista/paginas/principal.dart';
import 'vista/paginas/vistaSalarioProfesor.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 2.1 - ESPE',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        '/problema1': (context) => const Scaffold(body: Center(child: Text('Problema 1'))),
        // Rutas definidas en MenuEjercicios (Pendientes de implementación)
        '/ejercicio4.1': (context) => const VistaSalarioProfesor(),
        '/ejercicio4.2': (context) => const Scaffold(body: Center(child: Text('Ejercicio 4.2'))),
        '/ejercicio4.3': (context) => const Scaffold(body: Center(child: Text('Ejercicio 4.3'))),
        '/ejercicio4.8': (context) => const Scaffold(body: Center(child: Text('Ejercicio 4.8'))),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
