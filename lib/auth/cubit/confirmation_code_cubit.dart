import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirmation_code_state.dart';

class ConfirmationCodeCubit extends Cubit<int> {
  ConfirmationCodeCubit() : super(60);
  Timer? _timer;

  void resendCode() {
    //resend emaiil logic
    startCountDown(60);
  }

  void checkCode() {
    //check code logic
  }

  void startCountDown(int seconds) {
    _timer?.cancel(); // Cancel any existing timer
    emit(seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        emit(seconds);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
