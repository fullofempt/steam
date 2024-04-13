import 'dart:math';
import 'package:get/get.dart';
import 'package:steam/app/models/fakeDataClass.dart';
import 'package:steam/app/models/gameModel.dart';


class FakeApiService extends GetxService {
  Future<List<Game>> getGames() async{
    await _randomDelay();
    return FakeDataClass.games;
  }

  Future<void> _randomDelay() async {
    var random = Random().nextInt(2000);
    return Future.delayed(Duration(milliseconds: random));
  }
}
