import 'package:get/get.dart';

// Внутренний класс, представляющий игру
class Game {
  final String name; // Название игры
  final String imagePath; // Путь к изображению игры
  final String playTime; // Время в игре
  // Предполагаемое поле для даты добавления
  final DateTime addedDate;
  final String lastPlayed;

  Game(
      {required this.name,
      required this.imagePath,
      required this.playTime,
      required this.addedDate,
      required this.lastPlayed,
      });
}

class LibrariController extends GetxController {
  // Список игр
  RxList<Game> games = <Game>[
    Game(
      name: 'Counter Strike 2',
      imagePath: 'assets/images/cs2.jpg',
      playTime: '556 hours',
      lastPlayed: '1 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Dota 2',
      imagePath: 'assets/images/dota2.jpg',
      playTime: '2351 hours',
      lastPlayed: '5 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Golf It',
      imagePath: 'assets/images/golfit.jpg',
      playTime: '200 hours',
      lastPlayed: '31 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Monopoly',
      imagePath: 'assets/images/monopoly.png',
      playTime: '20 hours',
      lastPlayed: '12 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Red dead redemtion 2',
      imagePath: 'assets/images/rdr2.png',
      playTime: '223 hours',
      lastPlayed: '12 may',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Content Warning',
      imagePath: 'assets/images/cwar.png',
      playTime: '5 hours',
      lastPlayed: '12 december',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Crab Game',
      imagePath: 'assets/images/crabgame.png',
      playTime: '51 hours',
      lastPlayed: '2 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Fishing Planet',
      imagePath: 'assets/images/fishingplanet.png',
      playTime: '3000 hours',
      lastPlayed: '1 april',
      addedDate: DateTime.now(),
    ),
    Game(
      name: 'Battle Bit Remastered',
      imagePath: 'assets/images/bbrem.png',
      playTime: '52 hours',
      lastPlayed: '1 may',
      addedDate: DateTime.now(),
    ),
  ].obs;

  var sortOption = "Name".obs;

  void sortByName() {
    games.sort((a, b) => a.name.compareTo(b.name));
    sortOption.value = 'Name';
  }

  void sortByPlayTime() {
    games.sort((a, b) => a.playTime.compareTo(b.playTime));
    sortOption.value = 'PlayTime';
  }

  void sortByRecent() {
    games.sort((a, b) => b.addedDate.compareTo(a.addedDate));
    sortOption.value = 'Recent';
  }
}
