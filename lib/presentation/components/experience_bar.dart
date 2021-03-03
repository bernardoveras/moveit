import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class ExperienceBar extends StatelessWidget {
  /// O valor deve ser de [0] => [100].
  final int value;
  double get percentage {
    return double.parse((value / 100).toStringAsFixed(2));
  }

  const ExperienceBar(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInLeft(
            duration: Duration(milliseconds: 600),
            child: Text(
              '0 xp',
              style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.w500,
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
                    return Container(
                      height: 4,
                      width: constraints.maxWidth * percentage,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          FadeInRight(
            duration: Duration(milliseconds: 600),
            child: Text(
              '600 xp',
              style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
