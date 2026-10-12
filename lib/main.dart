import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const FlagsApp());
}

class FlagsApp extends StatelessWidget {
  const FlagsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Угадай флаг',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const QuizScreen(),
    );
  }
}