import 'package:flutter/material.dart';
import 'package:to_do/data/task_inherited.dart';
import 'package:to_do/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskInherited(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          scaffoldBackgroundColor: Color.fromRGBO(28, 27, 27, 1),
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromRGBO(28, 27, 27, 1),
          ),
        ),
        home: const InitialScreen(),
      ),
    );
  }
}
