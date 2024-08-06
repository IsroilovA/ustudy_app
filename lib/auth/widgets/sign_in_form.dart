import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _form,
        child: Column(
          children: [
            const Text("Имя"),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Введите имя',
              ),
              autocorrect: false,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите Имя';
                }
                return null;
              },
              onSaved: (value) {},
            ),
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
            const Text("Email"),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Введите почту',
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@')) {
                  return 'Введите корректный почтовый адрес';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const Text("Выберите"),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(child: Text("Школьник")),
                DropdownMenuItem(child: Text("Студент")),
                DropdownMenuItem(child: Text("Родитель")),
                DropdownMenuItem(child: Text("Учитель")),
              ],
              onChanged: (value) {},
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
            const Text("Повторите пароль"),
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
                TextButton(onPressed: () {}, child: const Text("Регистрация"))
              ],
            )
          ],
        ));
  }
}
