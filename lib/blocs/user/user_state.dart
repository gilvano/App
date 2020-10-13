part of 'user_bloc.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserLoadedState && o.users == users;
  }

  @override
  int get hashCode => users.hashCode;
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
