import 'package:flutter/material.dart';

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
          children: [
            const Text("Номер телефона"),
            TextFormField(
              decoration: const InputDecoration(
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
            const Text("Пароль"),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'Пароль должен быть длиннее 6 символов';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Введите пароль',
              ),
              obscureText: true,
              onSaved: (value) {},
            ),
            const SizedBox(height: 15),
            TextButton(onPressed: () {}, child: const Text("Войти")),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Еще не зраегстрированы?"),
                TextButton(onPressed: (){}, child: const Text("Регистрация"))
              ],
            )
          ],
        ));
  }
}
