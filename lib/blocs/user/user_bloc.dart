import 'package:bloc/bloc.dart';
import 'package:entrega_app/infra/cache/secure_cache_storage_adapter_factory.dart';
import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:entrega_app/infra/http/http_client_factory.dart';
import 'package:entrega_app/models/user_model.dart';
import 'package:entrega_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserInitialState());

  final SecureStorageAdapter storage = makeSecureStorageAdapter();
  // List<UserModel> allUsers;

  Future<void> getUsers() async {
    var users;
    try {
      emit(UserLoadingState());
      UserRepository repo = UserRepository(makeHttpAdapter(storage));
      users = await repo.getAll();
      print(users);
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> saveUser(String username, String password, String role) async {
    try {
      emit(UserLoadingState());
      UserRepository repo = UserRepository(makeHttpAdapter(storage));
      await repo.saveUser({
        "username": username,
        "password": password,
        "role": role,
      });
      emit(UserSavedState());
      emit(UserLoadingState());
      await getUsers();
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> editUser(UserModel user) async {
    try {
      emit(UserLoadingState());
      UserRepository repo = UserRepository(makeHttpAdapter(storage));
      await repo.editUser(user); //emit(AuthSuccessState());
      emit(UserUpdatedState(user));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> deleteUser(UserModel user) async {
    try {
      emit(UserLoadingState());
      UserRepository repo = UserRepository(makeHttpAdapter(storage));
      await repo.deleteUser(user); //emit(AuthSuccessState());
      emit(UserDeletedState(user));
      emit(UserLoadingState());
      await getUsers();
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
