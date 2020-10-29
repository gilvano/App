part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserSavedState extends UserState {}

class UserUpdatedState extends UserState {
  final UserModel user;
  UserUpdatedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserDeletedState extends UserState {
  final UserModel user;
  UserDeletedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);

  @override
  List<Object> get props => [message];
}
