import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit/shared/styles/colors.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInLeft(
            duration: Duration(milliseconds: 350),
            from: 30,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(80 / 2),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/56937988?v=4'),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 400),
                  from: 30,
                  child: Text(
                    'Bernardo Veras',
                    style: TextStyle(
                      color: AppColors.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                FadeInUp(
                  duration: Duration(milliseconds: 400),
                  from: 15,
                  delay: Duration(milliseconds: 200),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/level.svg'),
                      SizedBox(width: 8),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
