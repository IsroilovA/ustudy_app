import 'package:flutter/material.dart';
import 'package:ustudy_app/services/utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _form = GlobalKey<FormState>();
  // Initial Selected Value
  String dropdownvalue = '';

  // List of items in our dropdown menu
  var items = [
    '',
    'Школьник',
    'Студент',
    'Родитель',
    'Учитель',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Имя",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: customOutileBorder,
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
              "Email",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: customOutileBorder,
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
            Text(
              "Выберите",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: customOutileBorder,
              ),
              value: dropdownvalue,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownvalue = value!;
                });
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
            Text(
              "Повторите пароль",
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
                      "Зарегестрироваться",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
          ],
        ));
  }
}
