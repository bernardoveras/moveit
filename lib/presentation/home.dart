import 'package:flutter/material.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/shared/styles/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExperienceBar(),
          ],
        ),
      ),
    );
  }
}
