import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class MessageWidget extends StatefulWidget {
  final String message;
  final int? seconds;

  const MessageWidget(this.message, {this.seconds = 4});
  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      right: 0,
      child: SlideInRight(
        from: 400,
        controller: (controller) async {
          await Future.delayed(Duration(seconds: 4));
          controller.reverse();
        },
        child: Container(
          height: 100,
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              widget.message,
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.none,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
