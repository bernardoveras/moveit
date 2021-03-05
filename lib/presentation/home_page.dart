import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moveit/presentation/components/completed_challenges.dart';
import 'package:moveit/presentation/components/countdown.dart';
import 'package:moveit/presentation/components/cycle_button.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/presentation/components/finish_banner.dart';
import 'package:moveit/presentation/components/initial_banner.dart';
import 'package:moveit/presentation/components/profile.dart';
import 'package:moveit/presentation/components/started_banner.dart';
import 'package:moveit/presentation/home_controller.dart';
import 'package:moveit/shared/cycle_states.dart';
import 'package:moveit/shared/styles/colors.dart';

class HomePage extends GetView<HomeController> {
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Profile(user: controller.currentUser?.value),
                                    CompletedChallenges(controller.currentUser!.value!.completedChallenges),
                                    Obx(() => Countdown(controller.time)),
                                    Obx(
                                      () => CycleButton(
                                          state: controller.state,
                                          onPressed: () {
                                            if (controller.state ==
                                                CycleState.Initial) {
                                              controller.state =
                                                  CycleState.Started;
                                            } else if (controller.state ==
                                                CycleState.Started) {
                                              controller.resetState();
                                            }
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.6,
                                width: size.maxWidth / 2 - 100,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 50,
                                ),
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
                                child: Obx(
                                  () => controller.state == CycleState.Initial
                                      ? InitialBanner()
                                      : controller.state == CycleState.Started
                                          ? StartedBanner()
                                          : FinishBanner(),
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
