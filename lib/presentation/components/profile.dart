import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit/shared/styles/colors.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100 / 2),
              image: DecorationImage(
                image: NetworkImage('https://avatars.githubusercontent.com/u/56937988?v=4'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bernardo Veras',
                  style: TextStyle(
                    color: AppColors.title,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/level.svg'),
                    SizedBox(width: 5),
                    Text(
                      'Level 1',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
