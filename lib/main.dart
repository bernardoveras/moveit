import 'package:flutter/material.dart';
import 'package:moveit/presentation/home_page.dart';
import 'package:moveit/shared/styles/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moveit',
      debugShowCheckedModeBanner: false,
      theme: APP_THEME,
      home: HomePage(),
    );
  }
}
