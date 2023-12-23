import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_estados/bloc/user/user_bloc.dart';
import 'package:project_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Alexis',
                  edad: 31,
                  profesiones: ['FullStack Developer'],
                );
                // BlocProvider.of<UserBloc>(context, listen: false)
                userBloc.add(ActivateUser(newUser));
              },
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                // BlocProvider.of<UserBloc>(context, listen: false)
                userBloc.add(ChangeUserAge(32));
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(AddUserProfesion('Gamer profesional'));
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
