// Contiene la información de cual es el estado actual y procesa los eventos

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddUserProfesion>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(
          profesiones: [...state.user!.profesiones, event.profession])));
    });

    on<DeleteUser>(
      (event, emit) {
        if (!state.existUser) return;
        emit(const UserInitialState());
      },
    );
  }
}
