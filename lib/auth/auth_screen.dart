import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/cubit/auth_cubit.dart';
import 'package:ustudy_app/auth/widgets/login_form.dart';
import 'package:ustudy_app/auth/widgets/sign_in_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/login_image.jpg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 50),
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state is AuthLogin) {
                                return const LoginForm();
                              } else if (state is AuthSighIn) {
                                return const SignInForm();
                              }
                              return const Text("Something went worng");
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.isLogin ? "Забыли пароль?" : "Есть аккаунт?"),
                      TextButton(
                          onPressed: () {
                            if (!state.isLogin) {
                              BlocProvider.of<AuthCubit>(context).changeMod();
                            }
                          },
                          child: Text(state.isLogin ? "Восстановить" : "Войти",
                              style: const TextStyle(
                                color: Colors.red,
                                decorationColor: Colors.red,
                                decoration: TextDecoration.underline,
                              )))
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
