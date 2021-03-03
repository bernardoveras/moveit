import 'package:flutter/material.dart';
import 'package:moveit/presentation/components/completed_challenges.dart';
import 'package:moveit/presentation/components/experience_bar.dart';
import 'package:moveit/presentation/components/profile.dart';

class HomePage extends StatelessWidget {
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
                        top: 20,
                        child: ExperienceBar(0),
                      ),

                      Container(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.6,
                        alignment: Alignment.center,
                        child: LayoutBuilder(builder: (context, size) {
                          return Wrap(
                            runSpacing: 150,
                            alignment: WrapAlignment.spaceBetween,
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            clipBehavior: Clip.none,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.6,
                                width: size.maxWidth / 2 - 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Profile(),
                                    CompletedChallenges(),
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.6,
                                width: size.maxWidth / 2 - 75,
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

// child: LayoutBuilder(builder: (context, size) {
//                           return GridView.count(
//                             crossAxisCount: 2,
//                             clipBehavior: Clip.none,
//                             crossAxisSpacing: constraints.maxWidth * 0.12,
//                             childAspectRatio: constraints.maxWidth / 2,
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             children: [
//                               Container(
//                                 color: Colors.blue,
//                                 height: constraints.maxHeight * 0.6,
//                               ),
//                               Container(
//                                 height: constraints.maxHeight * 0.6,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade200,
//                                       blurRadius: 15.0,
//                                       spreadRadius: 1.0,
//                                     ),
//                                   ],
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
