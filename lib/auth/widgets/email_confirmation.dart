import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/cubit/confirmation_code_cubit.dart';

class EmailConfirmation extends StatefulWidget {
  const EmailConfirmation({super.key, required this.email});

  final String email;

  @override
  State<EmailConfirmation> createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  String enteredCode = '';
  @override
  void initState() {
    BlocProvider.of<ConfirmationCodeCubit>(context).startCountDown(60);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/email_confirmation.png'),
          Align(
            alignment: Alignment.center,
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "На вашу электронную почту ${widget.email} отправлен код подтверждения",
                      style: Theme.of(context).textTheme.bodyLarge,
                      softWrap: true,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemExtent: 80,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              showCursor: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blueGrey.shade100,
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none),
                              ),
                              maxLength: 1,
                              onChanged: (value) {
                                enteredCode = enteredCode + value;
                                if (index != 3 && value.isNotEmpty) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isNotEmpty) {
                                  FocusScope.of(context).unfocus();
                                  BlocProvider.of<ConfirmationCodeCubit>(
                                          context)
                                      .checkCode();
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    BlocBuilder<ConfirmationCodeCubit, int>(
                      builder: (context, state) {
                        if (state == 0) {
                          return TextButton(
                            onPressed: () {
                              BlocProvider.of<ConfirmationCodeCubit>(context)
                                  .resendCode();
                            },
                            child: const Text("Отправить код повторно"),
                          );
                        }
                        return Text(
                            "Запросить код повторно можно через $state");
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Нужна помощь?"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
