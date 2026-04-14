import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturaempleados.dart';
import 'verempleados.dart';

void main() => runApp(const AntigravityApp());

class AntigravityApp extends StatelessWidget {
  const AntigravityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antigravity Empleados',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Paleta de colores pastel Morado -> Azul
        primaryColor: const Color(0xFFD1C4E9), // Lavanda
        scaffoldBackgroundColor: const Color(0xFFF3E5F5), // Blanco purpúreo
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: const Color(0xFFB3E5FC), // Azul pastel
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/captura': (context) => const CapturaEmpleados(),
        '/ver': (context) => const VerEmpleados(),
      },
    );
  }
}