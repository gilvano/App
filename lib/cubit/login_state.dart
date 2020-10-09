part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginInProgressState extends LoginState {}

class LoginErrorState extends LoginState {}
