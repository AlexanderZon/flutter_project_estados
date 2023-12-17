import 'package:flutter/material.dart';
import 'package:project_estados/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null;

  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  void cambiarEdad(int value) {
    if (_usuario != null) {
      _usuario!.edad = value;
      notifyListeners();
    }
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    if (_usuario != null) {
      _usuario!.profesiones
          .add('Profesión ${_usuario!.profesiones.length + 1}');
      notifyListeners();
    }
  }
}
