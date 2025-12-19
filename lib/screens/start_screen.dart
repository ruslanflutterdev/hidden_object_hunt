import 'package:flutter/material.dart';
import '../screens/game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,//Переход на экран игры
              MaterialPageRoute(builder: (context) => const GameScreen()),
            );
          },
          child: const Text('Начать игру'),
        ),
      ),
    );
  }
}
