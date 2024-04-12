import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steam/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
        initialRoute: Routes.SPLASH,
        defaultTransition: Transition.fade,
        getPages: AppPages.routes,
    )
  );
}