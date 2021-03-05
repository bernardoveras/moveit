import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit/shared/styles/colors.dart';

class InitialBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      from: 40,
      duration: Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
