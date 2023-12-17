import 'package:flutter/material.dart';
import 'package:project_estados/models/usuario.dart';
import 'package:project_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                final usuario = Usuario(
                    nombre: 'Alexis',
                    edad: 30,
                    profesiones: [
                      'Fullstack Developer',
                      'Video jugador experto'
                    ]);
                usuarioService.usuario = usuario;
              },
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.cambiarEdad(31);
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.agregarProfesion();
              },
              color: Colors.blue,
              child: const Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
