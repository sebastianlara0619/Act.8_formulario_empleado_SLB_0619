import 'diccionarioempleado.dart';
import 'claseempleado.dart';

class AgenteGuardado {
  // Guardar nuevo (ID Autonumérico)
  static void guardar(String nombre, String puesto, double salario) {
    int nuevoId = datosEmpleado.isEmpty ? 1 : datosEmpleado.keys.last + 1;
    datosEmpleado[nuevoId] = Empleado(
      id: nuevoId,
      nombre: nombre,
      puesto: puesto,
      salario: salario,
    );
  }

  // ELIMINAR
  static void eliminar(int id) {
    datosEmpleado.remove(id);
  }

  // EDITAR
  static void editar(int id, String nombre, String puesto, double salario) {
    if (datosEmpleado.containsKey(id)) {
      datosEmpleado[id] = Empleado(
        id: id,
        nombre: nombre,
        puesto: puesto,
        salario: salario,
      );
    }
  }
}