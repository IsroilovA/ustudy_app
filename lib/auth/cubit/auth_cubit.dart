import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/cubit/confirmation_code_cubit.dart';
import 'package:ustudy_app/auth/widgets/email_confirmation.dart';
import 'package:ustudy_app/auth/widgets/sign_in_form.dart';
import 'package:ustudy_app/courses_list/cubit/courses_cubit.dart';
import 'package:ustudy_app/courses_list/courses_list_screen.dart';
import 'package:ustudy_app/services/locator.dart';
import 'package:ustudy_app/services/ustudy_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthLogin());

  void changeMod() {
    if (state is AuthSighIn) {
      emit(const AuthLogin());
    } else if (state is AuthLogin) {
      emit(const AuthSighIn());
    }
  }

  void logIn(
      {required String phoneNumber,
      required String password,
      required BuildContext context}) async {
    emit(AuthLoading(state.isLogin));
    bool isAdmin = false;
    try {
      //login logic
      if (password == "ustudyadmin") {
        isAdmin = true;
      }
    } catch (e) {
      emit(AuthError(state.isLogin, e.toString()));
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => CoursesCubit(
            ustudyRepository: locator<UstudyRepository>(), isAdmin: isAdmin),
        child: const HomeScreen(),
      ),
    ));
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
