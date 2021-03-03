import 'package:flutter/material.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/shared/styles/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 50,
                child: ExperienceBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
