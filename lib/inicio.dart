import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1BEE7), Color(0xFFB3E5FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cambio de Logo: de cohete a teléfono
              const Icon(Icons.phone_android, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              // Cambio de Nombre: Celulares Lara
              const Text(
                "CELULARES LARA",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white, 
                  letterSpacing: 2
                ),
              ),
              const SizedBox(height: 50),
              _botonMenu(context, "Capturar Empleado", Icons.person_add, '/captura'),
              const SizedBox(height: 20),
              _botonMenu(context, "Ver Empleados", Icons.list_alt, '/ver'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botonMenu(BuildContext context, String texto, IconData icono, String ruta) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9),
        foregroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
      onPressed: () => Navigator.pushNamed(context, ruta),
      icon: Icon(icono),
      label: Text(texto, style: const TextStyle(fontSize: 18)),
    );
  }
}