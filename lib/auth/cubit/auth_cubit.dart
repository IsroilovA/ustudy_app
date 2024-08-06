import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
}
