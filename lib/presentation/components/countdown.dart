import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class Countdown extends StatelessWidget {
  final int countdownTime;

  const Countdown([this.countdownTime = 25]);

  int get time => (countdownTime * 60);
  int get minutes => (time / 60).floor();
  int get seconds => (time % 60);

  List<String> get minutesArray => minutes.toString().padLeft(2, '0').split('');
  List<String> get secondsArray => seconds.toString().padLeft(2, '0').split('');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        clipBehavior: Clip.none,
        direction: Axis.horizontal,
        children: [
          CountdownNumberContainer(
              leftValue: minutesArray[0], rightValue: minutesArray[1]),
          Text(
            ':',
            style: TextStyle(
              fontFamily: 'Rajdhani',
              color: AppColors.title,
              fontSize: 150,
            ),
          ),
          CountdownNumberContainer(
              leftValue: secondsArray[0],
              rightValue: secondsArray[1],
              showBorder: true),
        ],
      ),
    );
  }
}

class CountdownNumberContainer extends StatelessWidget {
  final String leftValue;
  final String rightValue;
  final bool showBorder;

  CountdownNumberContainer(
      {this.leftValue = '0', this.rightValue = '0', this.showBorder = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: FadeInLeft(
            duration: Duration(milliseconds: 300),
            from: 10,
            child: Text(
              '$leftValue',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                color: AppColors.title,
                fontSize: 150,
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: Color(0xFFF0F1F3),
                  width: 1.5,
                ),
              )),
          alignment: Alignment.center,
          child: FadeInRight(
            from: 10,
            duration: Duration(milliseconds: 300),
            child: Text(
              '$rightValue',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                color: AppColors.title,
                fontSize: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
