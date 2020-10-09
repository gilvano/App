import 'package:bloc/bloc.dart';
import 'package:entrega_app/models/auth_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());


  Future<AuthModel> authenticate(String email, String password) {
    try {
      emit(LoginInProgressState());
      return Future.delayed(Duration(seconds: 3), () {
        if (email == 'aaa' && password == '123') {
          emit(LoginSuccessState());
          return AuthModel(username: 'name', token: 'fdsasfd');
        }
        return null;
      });

  
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
