import 'package:flutter/material.dart';
import '../models/cell.dart';

class CellWidget extends StatelessWidget {
  final Cell cell;//Клетка
  final VoidCallback onTap;//Функция при нажатии
  final bool isRevealed;//Флаг отккрыта ли клетка

  const CellWidget({
    super.key,
    required this.cell,
    required this.onTap,
    required this.isRevealed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isRevealed ? null : onTap,//Если клетка уже открыта, отключаем нажатие
      child: Container(
        margin: const EdgeInsets.all(4),//Отступы вокруг клетки
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),//Округление углов
          color: isRevealed ? Colors.white : Colors.green,//Цвет клетки
          border: Border.all(
              // Черная рамка вокруг клетки
              color: Colors.black,
              width: 2),//Толщина рамки
        ),
        child: isRevealed
            ? (cell.hasItem
                ? Image.asset('assets/bomb.png')//Если предмет найден показывает картинку
                : const Icon(Icons.close, size: 30))//Иначе крестик
            : null,//Если клетка не открыта ничего не отображаем
      ),
    );
  }
}
