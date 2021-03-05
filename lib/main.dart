// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveit/presentation/home_page.dart';
import 'package:moveit/shared/styles/theme.dart';
import 'presentation/home_controller.dart';
import 'shared/services/message_service.dart';

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
          binding: HomeBinding(context),
        ),
      ],
      theme: APP_THEME,

    );
  }
}

class HomeBinding extends Bindings{
  final BuildContext context;
  HomeBinding(this.context);

  @override
  void dependencies() {
    Get.create<IMessageService>(()=> MessageService());
    Get.lazyPut(() => HomeController());
  }

}