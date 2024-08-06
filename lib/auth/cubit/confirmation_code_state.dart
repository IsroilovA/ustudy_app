part of 'confirmation_code_cubit.dart';

@immutable
sealed class CountdownState {
  final int secondsLeft;
  const CountdownState(this.secondsLeft);
}
