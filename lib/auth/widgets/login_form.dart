import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/cubit/auth_cubit.dart';
import 'package:ustudy_app/services/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Номер телефона",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: customOutileBorder,
                labelText: 'Введите номер',
              ),
              keyboardType: TextInputType.phone,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.contains(RegExp(r'^[0-9+\-()\s]+$'))) {
                  return 'Введи корректный номер телефона';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            Text(
              "Пароль",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'Пароль должен быть длиннее 6 символов';
                }
                return null;
              },
              decoration: InputDecoration(
                border: customOutileBorder,
                labelText: 'Введите пароль',
              ),
              obscureText: true,
              onSaved: (value) {},
            ),
            const SizedBox(height: 30),
            Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Войти",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Еще не зраегстрированы?"),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).changeMod();
                    },
                    child: const Text("Регистрация",
                        style: TextStyle(
                          color: Colors.red,
                          decorationColor: Colors.red,
                          decoration: TextDecoration.underline,
                        )))
              ],
            )
          ],
        ));
  }
}
