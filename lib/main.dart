import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//==============================================//
import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'core/routes/bindings/index.dart';
import 'core/constant/themes.dart';

void main() async {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  ).then((_) {
    runApp(GetMaterialApp(
      title: "ItungDuit",
      initialBinding: InitialBinding(),
      initialRoute: Routes.initialRoute,
      getPages: Pages.pagesList,
      theme: Themes.getTheme(Get.overlayContext),
    ));
  });
}