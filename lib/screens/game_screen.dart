import 'package:flutter/material.dart'; // Импорт библиотеки Flutter
import '../widgets/cell_widget.dart'; // Импорт виджета клетки
import '../widgets/game_controls.dart'; // Импорт элементов управления
import '../models/cell.dart'; // Импорт модели клетки

class GameScreen extends StatefulWidget {
  const GameScreen({super.key}); // Конструктор

  @override
  _GameScreenState createState() =>
      _GameScreenState(); // Создание состояния игры
}

class _GameScreenState extends State<GameScreen> {
  List<Cell> cells = []; // Список всех клеток
  Set<int> revealedCells = {}; // Набор открытых клеток
  int attempts = 0; // Количество попыток
  bool gameOver = false; // Флаг завершения игры

  @override
  void initState() {
    super.initState();
    _initializeGame(); // Запускаем игру при старте экрана
  }

  void _initializeGame() {
    List<Cell> tempCells =
        List.generate(36, (index) => Cell(id: index)); // Создаём 36 клеток
    tempCells[0].hasItem = true; // Прячем предмет в первой клетке
    tempCells.shuffle(); // Перемешиваем клетки

    setState(() {
      cells = tempCells; // Записываем клетки в список
      revealedCells.clear(); // Очищаем открытые клетки
      attempts = 0; // Обнуляем попытки
      gameOver = false; // Сбрасываем флаг завершения игры
    });
  }

  void _revealCell(int index) {
    if (!revealedCells.contains(index) && !gameOver) {
      // Если клетка не открыта и игра не окончена
      setState(() {
        revealedCells.add(index); // Добавляем клетку в открытые
        attempts++; // Увеличиваем попытки
        if (cells[index].hasItem) {
          // Если нашли предмет
          gameOver = true; // Завершаем игру
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Поиск предмета')),
      // Верхняя панель с названием игры
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Размещение по центру
        children: [
          GridView.count(
            shrinkWrap: true, // Ограничиваем размер
            crossAxisCount: 6, // Шесть колонок
            children: List.generate(
              cells.length,
              (index) => CellWidget(
                cell: cells[index],
                // Передаём клетку
                onTap: gameOver ? () {} : () => _revealCell(index),
                // Если игра окончена, блокируем клики
                isRevealed: revealedCells
                    .contains(index), // Проверяем, открыта ли клетка
              ),
            ),
          ),
          SizedBox(height: 20),
          GameControls(attempts: attempts, onReset: _initializeGame),
          // Элементы управления
          if (gameOver) // Если игра окончена, показываем сообщение
            const Text(
              'Игра окончена!',
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
