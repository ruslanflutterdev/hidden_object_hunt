class Cell {
  final int id; // Уникальный идентификатор клетки
  bool hasItem; // Содержит ли предмет

  Cell({
    required this.id,
    this.hasItem = false, // По умолчанию предмета нет
  });
}