import 'dart:async';

import 'package:project_estados/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;

  _UsuarioService() {
    _usuario = null;
  }

  StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario get usuario => _usuario!;

  bool get existeUsuario => _usuario != null;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario usuario) {
    _usuario = usuario;
    _usuarioStreamController.add(usuario);
  }

  void cambiarEdad(int edad) {
    if (_usuario != null) {
      _usuario!.edad = edad;
      _usuarioStreamController.add(_usuario!);
    }
  }

  dispose() {
    _usuarioStreamController?.close();
  }
}

final usuarioService = _UsuarioService();
