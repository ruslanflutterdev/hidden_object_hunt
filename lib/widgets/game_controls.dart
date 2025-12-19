import 'package:flutter/material.dart';

class GameControls extends StatelessWidget {
  final int attempts; //Количество попыток
  final VoidCallback onReset;//Функция сброса игры

  const GameControls({
    super.key,
    required this.attempts,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Попытки: $attempts',//Отображает количество попыток
          style: const TextStyle(
            fontSize: 30,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onReset,
          child: const Text('Сначала'),
        ),
      ],
    );
  }
}
