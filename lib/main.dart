import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//==============================================//
import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'core/routes/bindings/index.dart';
import 'core/constant/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  ).then((_) {
    runApp(ItungDuitApp());
  });
}

class ItungDuitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ItungDuit",
      initialBinding: InitialBinding(),
      initialRoute: Routes.initialRoute,
      getPages: Pages.pagesList,
      theme: Themes.getTheme(context),
    );
  }
}