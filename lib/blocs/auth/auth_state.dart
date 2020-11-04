part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
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
  List<Object> get props => [message];
}
