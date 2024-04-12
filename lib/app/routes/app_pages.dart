import 'package:get/get.dart';

import '../modules/librari/bindings/librari_binding.dart';
import '../modules/librari/views/librari_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LIBRARI;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARI,
      page: () => const LibrariView(),
      binding: LibrariBinding(),
    ),
  ];
}
