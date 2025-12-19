import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const HiddenOjectGame());
}

class HiddenOjectGame extends StatelessWidget {
  const HiddenOjectGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Поиск спрятанного предмета',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white30,
      ),
      home: const StartScreen(),
    );
  }
}
