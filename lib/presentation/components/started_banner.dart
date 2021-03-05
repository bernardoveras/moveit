import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit/shared/styles/colors.dart';

class StartedBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      from: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
