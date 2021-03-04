import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/presentation/components/completed_challenges.dart';
import 'package:moveit/presentation/components/countdown.dart';
import 'package:moveit/presentation/components/cycle_button.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/presentation/components/profile.dart';
import 'package:moveit/shared/styles/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool active = false;
  int time = 25;

  set setActive(bool value) {
    setState(() {
      active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: AspectRatio(
                  aspectRatio: constraints.maxWidth / constraints.maxHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //Header
                      Positioned(
                        top: 40,
                        child: ExperienceBar(0),
                      ),

                      Container(
                        width: constraints.maxWidth * 0.65,
                        height: constraints.maxHeight * 0.6,
                        alignment: Alignment.center,
                        child: LayoutBuilder(builder: (context, size) {
                          return Wrap(
                            runSpacing: 200,
                            alignment: WrapAlignment.spaceBetween,
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            clipBehavior: Clip.none,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.6,
                                width: size.maxWidth / 2 - 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Profile(),
                                    CompletedChallenges(),
                                    Countdown(time),
                                    CycleButton(
                                        active: active,
                                        onPressed: () => setActive = !active),
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.6,
                                width: size.maxWidth / 2 - 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 60.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
