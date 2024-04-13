// Внутренний класс, представляющий игру
import 'dart:ffi';

class Game {
  final String name;
  final String imagePath;
  final String playTime;
  final DateTime addedDate;
  final String lastPlayed;

  Game({
    required this.name,
    required this.imagePath,
    required this.playTime,
    required this.addedDate,
    required this.lastPlayed,
  });
}
