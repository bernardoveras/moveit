import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class ExperienceBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.5,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '0 xp',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
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
                    width: constraints.maxWidth / 2,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            '600 xp',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
