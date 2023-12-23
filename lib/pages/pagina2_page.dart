import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_estados/controllers/usuario_controller.dart';
import 'package:project_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Alexis', edad: 30));

                Get.snackbar(
                    'Usuario establecido', 'Alexis es el nombre del usuario',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]);
              },
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cambiarEdad(31);
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Profesión #${usuarioCtrl.profesionesCount + 1}');
              },
              color: Colors.blue,
              child: const Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Tema',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
