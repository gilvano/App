import 'package:bloc/bloc.dart';
import 'package:entrega_app/infra/cache/secure_cache_storage_adapter_factory.dart';
import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:entrega_app/infra/http/http_client_factory.dart';
import 'package:entrega_app/models/auth_model.dart';
import 'package:entrega_app/repositories/auth_repository.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthModel _authModel;
  AuthBloc() : super(AuthInitialState());

  final SecureStorageAdapter storage = makeSecureStorageAdapter();

  Future<void> authenticate(String username, String password) async {
    try {
      emit(AuthInProgressState());
      AuthRepository repo = AuthRepository(makeHttpAdapter(storage));
      _authModel = await repo.login({
        "username": username,
        "password": password,
      });
      storage.saveSecure(key: "token", value: _authModel.token);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  logout() {
    storage.saveSecure(key: "token", value: null);
    emit(AuthLogoutState());
    GetIt.I.get<NavigationService>().logout();
  }
}
