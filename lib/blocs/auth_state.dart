part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthInProgressState extends AuthState {}

class AuthErrorState extends AuthState {}
