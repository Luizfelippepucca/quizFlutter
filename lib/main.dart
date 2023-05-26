import 'package:flutter/material.dart';
import 'package:quiz/quiz_dados.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'quiz': (context) => Quiz(
              quiz: quiz,
            ),
        ResultPage.routeName: (context) => const ResultPage()
      },
    );
  }
}
