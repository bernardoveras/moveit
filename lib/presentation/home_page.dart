import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moveit/presentation/components/completed_challenges.dart';
import 'package:moveit/presentation/components/countdown.dart';
import 'package:moveit/presentation/components/cycle_button.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/presentation/components/profile.dart';
import 'package:moveit/presentation/home_controller.dart';
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
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Profile(),
                                    CompletedChallenges(),
                                    Obx(() => Countdown(controller.time)),
                                    Obx(() => CycleButton(
                                        active: controller.active,
                                        onPressed: () => controller.active =
                                            !controller.active)),
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
                                child: Obx(
                                  () => controller.active
                                      ? FadeInUp(
                                          duration: Duration(milliseconds: 300),
                                          from: 40,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Finalize o ciclo\npara receber desafios a\n serem completados',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.title,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30,
                                                  height: 1.3,
                                                ),
                                              ),
                                              SizedBox(height: 50),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/level-up.svg',
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                  SizedBox(width: 20),
                                                  Text(
                                                    'Complete-os e ganhe\nexperiência e avançe de leve!',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: AppColors.title,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                        height: 1.5),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : FadeInDown(
                                          from: 40,
                                          duration: Duration(milliseconds: 300),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Inicie um ciclo\npara receber desafios',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.title,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/level-up.svg',
                                                height: 120,
                                                width: 120,
                                              ),
                                              Text(
                                                'Avançe de level completando\nos desafios.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.title,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
