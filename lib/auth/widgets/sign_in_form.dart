import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/cubit/auth_cubit.dart';
import 'package:ustudy_app/services/utils.dart';

enum Occupation { pupil, student, parent, teacher }

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _form = GlobalKey<FormState>();
  // Initial Selected Value
  var _dropdownValue = Occupation.pupil;
  var _enteredPhone = '';
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  void _submit() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    BlocProvider.of<AuthCubit>(context).signIn(
        phoneNumber: _enteredPhone,
        password: _enteredPassword,
        emailAddress: _enteredEmail,
        name: _enteredName,
        occupation: _dropdownValue);
  }

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
              onSaved: (value) {
                _enteredName = value!;
              },
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
                    !value.contains(RegExp(r'^[0-9+\-()\s]+$'))) {
                  return 'Введи корректный номер телефона';
                }
                return null;
              },
              onSaved: (value) {
                _enteredPhone = value!;
              },
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
              onSaved: (value) {
                _enteredEmail = value!;
              },
            ),
            Text(
              "Выберите",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: customOutileBorder,
              ),
              value: _dropdownValue,
              items: Occupation.values.map(
                (var occupationItem) {
                  return DropdownMenuItem(
                    value: occupationItem,
                    child: Text(occupationItem.name),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
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
              onChanged: (value) {
                _enteredPassword = value;
              },
              onSaved: (value) {
                _enteredPassword = value!;
              },
            ),
            Text(
              "Повторите пароль",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              validator: (value) {
                if (value != _enteredPassword) {
                  return 'Пароли должны совподать';
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
                    onPressed: _submit,
                    child: Text(
                      "Продолжить",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
          ],
        ));
  }
}
