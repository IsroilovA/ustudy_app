import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustudy_app/auth/widgets/sign_in_form.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLogin());

  void changeMod() {
    if (state is AuthSighIn) {
      emit(AuthLogin());
    } else if (state is AuthLogin) {
      emit(AuthSighIn());
    }
  }

  void logIn({required String phoneNumber, required String password}) async {
    emit(AuthLoading(state.isLogin));
    try {
      //login logic
    } catch (e) {
      emit(AuthError(state.isLogin, e.toString()));
    }
  }

  void signIn({
    required String name,
    required String phoneNumber,
    required String emailAddress,
    required Occupation occupation,
    required String password,
  }) async {
    emit(AuthLoading(state.isLogin));
    try {
      //sign in logic
    } catch (e) {
      emit(AuthError(state.isLogin, e.toString()));
    }
  }
}
