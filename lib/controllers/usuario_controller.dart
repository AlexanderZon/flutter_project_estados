import 'package:get/get.dart';
import 'package:project_estados/models/usuario.dart';

class UsuarioController extends GetxController {
  Rx<bool> existeUsuario = false.obs;
  Rx<Usuario> usuario = Usuario().obs;

  int get profesionesCount {
    return usuario.value.profesiones!.length;
  }

  void cargarUsuario(Usuario user) {
    usuario.value = user;
    existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones ?? [], profesion];
    });
  }
}
