import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moveit/shared/styles/colors.dart';

class CycleButton extends StatelessWidget {
  final bool active;
  final Function()? onPressed;
  CycleButton({this.active = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      from: 20,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) return Colors.white;
            
            return active ? Color(0xFF666666) : Colors.white;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return active ? AppColors.red : AppColors.blueDark;
              if (states.contains(MaterialState.hovered))
                return active ? AppColors.red : AppColors.blueDark;

              return active ? Colors.white : AppColors.blue;
            },
          ),
          elevation: MaterialStateProperty.all(0),
          animationDuration: Duration(milliseconds: active ? 200 : 300),
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 80),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              active ? 'Abandonar ciclo' : 'Iniciar um ciclo',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              active ? Icons.close : Icons.play_arrow_rounded,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
