import 'package:flutter/material.dart';
import 'package:ustudy_app/auth/widgets/login_form.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/login_image.jpg'),
              ),
          const Column(
            children: [
              Card(
                child: LoginForm(),
              )
            ],
          )
        ],
      ),
    );
  }
}