import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class Countdown extends StatelessWidget {
  int countdownTime;
  int _minutes = 0;
  int _seconds = 0;
  List<String>? _minutesArray = ['0', '0'];
  List<String>? _secondsArray = ['0', '0'];

  Countdown([this.countdownTime = 25]) {
    this.countdownTime = countdownTime;
    _minutes = (countdownTime / 60).floor();
    _seconds = countdownTime % 60;

    _minutesArray = _minutes.toString().padLeft(2, '0').split('');
    _secondsArray = _seconds.toString().padLeft(2, '0').split('');
  }

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
              leftValue: _minutesArray![0], rightValue: _minutesArray![1]),
          Text(
            ':',
            style: TextStyle(
              fontFamily: 'Rajdhani',
              color: AppColors.title,
              fontSize: 150,
            ),
          ),
          CountdownNumberContainer(
              leftValue: _secondsArray![0],
              rightValue: _secondsArray![1],
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
