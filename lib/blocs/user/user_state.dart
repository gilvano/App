part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserUpdatingState extends UserState {}

class UserDeletingState extends UserState {}

@immutable
class UsersLoadedState extends UserState {
  final List<UserModel> users;
  UsersLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserSavedState extends UserState {}

@immutable
class UserUpdatedState extends UserState {
  final UserModel user;
  UserUpdatedState(this.user);

  @override
  List<Object> get props => [user];
}

@immutable
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
