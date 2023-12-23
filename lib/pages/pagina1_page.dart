import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_estados/bloc/user/user_bloc.dart';
import 'package:project_estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(DeleteUser());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(
                  user: state.user!,
                )
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),

      // const InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesiones.map((e) => ListTile(title: Text(e))).toList(),
        ],
      ),
    );
  }
}
