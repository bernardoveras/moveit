import 'package:flutter/material.dart';
import 'package:moveit/presentation/components/completed_challenges.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/presentation/components/profile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ExperienceBar(),
            Profile(),
            CompletedChallenges(),
          ],
        ),
      ),
    );
  }
}
