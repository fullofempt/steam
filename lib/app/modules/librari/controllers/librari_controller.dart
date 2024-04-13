import 'package:get/get.dart';
import 'package:steam/app/models/gameModel.dart';
import 'package:steam/app/services/fakeApiServices.dart';

class LibrariController extends GetxController {
  final FakeApiService _apiService = Get.put(FakeApiService()); // Инициализация FakeApiService

  // Список игр
  RxList<Game> games = <Game>[].obs;

  var sortOption = "Name".obs;

  // Сортировка по имени
  void sortByName() {
    games.value.sort((a, b) => a.name.compareTo(b.name));
    sortOption.value = 'Name';
    update();
  }

  // Сортировка по времени в игре
  void sortByPlayTime() {
    games.value.sort((a, b) => a.playTime.compareTo(b.playTime));
    sortOption.value = 'PlayTime';
    update();
  }

  // Сортировка по последнему запуску
  void sortByRecent() {
    games.value.sort((a, b) => b.lastPlayed.compareTo(a.lastPlayed));
    sortOption.value = 'Recent';
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _fetchGames();
  }

  Future<void> _fetchGames() async {
    try {
      games.value = await _apiService.getGames();
    } catch (e) {
      print("Error fetching games: $e");
    }
  }
}
