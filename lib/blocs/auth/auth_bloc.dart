import 'package:bloc/bloc.dart';
import 'package:entrega_app/infra/cache/secure_cache_storage_adapter_factory.dart';
import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:entrega_app/infra/http/http_client_factory.dart';
import 'package:entrega_app/models/auth_model.dart';
import 'package:entrega_app/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthInitialState());

  final SecureStorageAdapter storage = makeSecureStorageAdapter();

  Future<void> authenticate(String username, String password) async {
    try {
      emit(AuthInProgressState());
      AuthRepository repo = AuthRepository(makeHttpAdapter(storage));
      final AuthModel authModel = await repo.login({
        "username": username,
        "password": password,
      });
      storage.saveSecure(key: "token", value: authModel.token);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
