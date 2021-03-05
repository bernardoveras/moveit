import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class ExperienceBar extends StatelessWidget {
  /// O valor deve ser de [0] => [100].
  /// Calculo da porcentagem:
  ///
  final int value;
  final int minValue;
  final int maxValue;

  ExperienceBar(this.value, this.minValue, this.maxValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.65,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            alignment: Alignment.center,
            child: FadeInLeft(
              duration: Duration(milliseconds: 600),
              child: Text(
                '$minValue xp',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: FadeIn(
              duration: Duration(milliseconds: 600),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 4,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.grayLine,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        value != 0
                            ? Positioned(
                                right: 0,
                                top: 15,
                                child: Text(
                                  '$value xp',
                                  style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: 4,
                          width: calculateProgressValue(
                              constraints.maxWidth, value, maxValue),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            child: FadeInRight(
              duration: Duration(milliseconds: 600),
              child: Text(
                '$maxValue xp',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateProgressValue(double totalWidth, int points, int maxValue) {
    return totalWidth / maxValue * points;
  }
}
