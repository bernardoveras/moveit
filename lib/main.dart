// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveit/presentation/home_page.dart';
import 'package:moveit/shared/styles/theme.dart';

import 'presentation/home_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App('/'));
}

class App extends StatelessWidget {
  final String initialRoute;
  App(this.initialRoute);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inicio | move.it',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ],
      theme: APP_THEME,
      home: HomePage(),
    );
  }
}

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}