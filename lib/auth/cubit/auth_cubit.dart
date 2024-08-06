import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustudy_app/auth/cubit/confirmation_code_cubit.dart';
import 'package:ustudy_app/auth/widgets/email_confirmation.dart';
import 'package:ustudy_app/auth/widgets/sign_in_form.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLogin());

  void changeMod() {
    if (state is AuthSighIn) {
      emit(const AuthLogin());
    } else if (state is AuthLogin) {
      emit(const AuthSighIn());
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
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String emailAddress,
    required Occupation occupation,
    required String password,
  }) async {
    emit(AuthLoading(state.isLogin));
    try {
      //sign in logic
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ConfirmationCodeCubit(),
            child: EmailConfirmation(email: emailAddress),
          ),
        ),
      );
    } catch (e) {
      emit(AuthError(state.isLogin, e.toString()));
    }
  }
}
