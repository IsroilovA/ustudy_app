import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustudy_app/auth/auth_screen.dart';
import 'package:ustudy_app/auth/cubit/auth_cubit.dart';

// Theme for the light mode
final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(
        255, 173, 173, 173), // Primary color for the light theme
    brightness: Brightness.light, // Brightness setting for the light theme
  ),
);

// Theme for the dark mode
final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor:
        const Color.fromARGB(230, 0, 0, 0), // Primary color for the dark theme
    brightness: Brightness.dark, // Brightness setting for the dark theme
  ),
);

void main() {
  runApp(const App());
}

// Root widget of the application
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, // Applying the light theme
      darkTheme: darkTheme, // Applying the dark theme
      home: BlocProvider(
        create: (context) => AuthCubit(),
        child: const AuthScreen()
      ),
    );
  }
}
