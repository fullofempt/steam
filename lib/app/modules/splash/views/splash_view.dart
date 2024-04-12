import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AssetImage splashImage = AssetImage('assets/images/splash.jpg');

    const splashDuration = Duration(seconds: 2);

    Future.delayed(splashDuration, () {
      Get.offNamed('/librari');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                image: splashImage,
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
