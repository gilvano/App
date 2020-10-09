import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:entrega_app/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthInitialState());

  Future<void> authenticate(String username, String password) async {
    try {
      //emit(AuthInProgressState());
      emit(AuthInProgressState());
      AuthRepository repo = AuthRepository(Dio());
      await repo.login({
        "username": username,
        "password": password,
      });
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e));
    }
  }
}
