import 'package:flutter/material.dart';
import 'diccionarioempleado.dart';
import 'guardardatosdiccionario.dart';

class VerEmpleados extends StatefulWidget {
  const VerEmpleados({super.key});

  @override
  State<VerEmpleados> createState() => _VerEmpleadosState();
}

class _VerEmpleadosState extends State<VerEmpleados> {
  
  // Función para refrescar la pantalla al borrar o editar
  void _actualizar() => setState(() {});

  // Cuadro de diálogo para editar
  void _mostrarDialogoEdicion(BuildContext context, int id, String nombre, String puesto, double salario) {
    final nombreCtrl = TextEditingController(text: nombre);
    final puestoCtrl = TextEditingController(text: puesto);
    final salarioCtrl = TextEditingController(text: salario.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Editar Empleado #$id", style: const TextStyle(color: Colors.deepPurple)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nombreCtrl, decoration: const InputDecoration(labelText: "Nombre")),
            TextField(controller: puestoCtrl, decoration: const InputDecoration(labelText: "Puesto")),
            TextField(controller: salarioCtrl, decoration: const InputDecoration(labelText: "Salario"), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () {
              AgenteGuardado.editar(id, nombreCtrl.text, puestoCtrl.text, double.parse(salarioCtrl.text));
              _actualizar();
              Navigator.pop(context);
            },
            child: const Text("Guardar Cambios"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lista = datosEmpleado.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Plantilla Celulares Lara")),
      body: lista.isEmpty
          ? const Center(child: Text("No hay registros."))
          : ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final emp = lista[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[50],
                      child: Text("${emp.id}"),
                    ),
                    title: Text(emp.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${emp.puesto} - \$${emp.salario}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // BOTÓN EDITAR
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () => _mostrarDialogoEdicion(context, emp.id, emp.nombre, emp.puesto, emp.salario),
                        ),
                        // BOTÓN BORRAR
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                          onPressed: () {
                            AgenteGuardado.eliminar(emp.id);
                            _actualizar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Empleado eliminado"), backgroundColor: Colors.orange),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}