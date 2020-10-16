part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {
  AuthSuccessState() {
    GetIt.I.get<NavigationService>().navigateTo(HomeRoute);
  }
}

class AuthInProgressState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
