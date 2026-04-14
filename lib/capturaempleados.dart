import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaEmpleados extends StatefulWidget {
  const CapturaEmpleados({super.key});

  @override
  State<CapturaEmpleados> createState() => _CapturaEmpleadosState();
}

class _CapturaEmpleadosState extends State<CapturaEmpleados> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _puestoCtrl = TextEditingController();
  final _salarioCtrl = TextEditingController();

  void _procesarGuardado() {
    if (_formKey.currentState!.validate()) {
      try {
        // Llamamos al agente para guardar
        AgenteGuardado.guardar(
          _nombreCtrl.text,
          _puestoCtrl.text,
          double.parse(_salarioCtrl.text),
        );
        
        // Mensaje de éxito solicitado
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Registro exitoso!'), 
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        
        // Limpiar campos después del éxito
        _nombreCtrl.clear();
        _puestoCtrl.clear();
        _salarioCtrl.clear();
        
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Registro - Lara"),
        backgroundColor: const Color(0xFFD1C4E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _crearInput(_nombreCtrl, "Nombre del Empleado", Icons.person),
              const SizedBox(height: 20),
              _crearInput(_puestoCtrl, "Puesto / Cargo", Icons.badge),
              const SizedBox(height: 20),
              _crearInput(_salarioCtrl, "Salario Quincenal", Icons.monetization_on, isNumber: true),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9575CD), // Morado pastel intenso
                  padding: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                onPressed: _procesarGuardado,
                child: const Text("REGISTRAR AHORA", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearInput(TextEditingController ctrl, String label, IconData icono, {bool isNumber = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icono, color: Colors.blue[300]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.deepPurple, width: 1)),
      ),
      validator: (value) => value!.isEmpty ? "Este dato es necesario" : null,
    );
  }
}