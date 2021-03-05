import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moveit/shared/cycle_states.dart';
import 'package:moveit/shared/styles/colors.dart';

class CycleButton extends StatelessWidget {
  final CycleState state;
  final Function()? onPressed;
  CycleButton({required this.state, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 300),
      from: 20,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: state == CycleState.Finish
                ? BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  )
                : BorderRadius.zero,
          ),
        ),
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            border: state == CycleState.Finish
                ? Border(
                    bottom: BorderSide(
                      color: AppColors.green,
                      width: 8,
                    ),
                  )
                : null,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return state != CycleState.Finish
                      ? Colors.white
                      : Color(0xFF666666);

                return state == CycleState.Started || state == CycleState.Finish
                    ? Color(0xFF666666)
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed) ||
                      states.contains(MaterialState.hovered)) {
                    switch (state) {
                      case CycleState.Initial:
                        return AppColors.blueDark;
                      case CycleState.Started:
                        return AppColors.red;
                      case CycleState.Finish:
                        return Colors.white;
                      default:
                        return AppColors.blue;
                    }
                  }

                  switch (state) {
                    case CycleState.Initial:
                      return AppColors.blue;
                    case CycleState.Started:
                      return Colors.white;
                    case CycleState.Finish:
                      return Colors.white;
                    default:
                      return AppColors.blue;
                  }
                },
              ),
              mouseCursor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return state == CycleState.Finish
                      ? SystemMouseCursors.noDrop
                      : SystemMouseCursors.click;
              }),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              elevation: MaterialStateProperty.all(0),
              animationDuration: Duration(
                  milliseconds: state != CycleState.Initial ? 200 : 300),
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
                  handleText(state),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  handleIcon(state),
                  size: 24,
                  color: state == CycleState.Finish ? AppColors.green : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData handleIcon(CycleState state) {
    switch (state) {
      case CycleState.Initial:
        return Icons.play_arrow_rounded;
      case CycleState.Started:
        return Icons.close;
      case CycleState.Finish:
        return Icons.check_circle;
      default:
        return Icons.play_arrow_rounded;
    }
  }

  String handleText(CycleState state) {
    switch (state) {
      case CycleState.Initial:
        return 'Iniciar um ciclo';
      case CycleState.Started:
        return 'Abandonar ciclo';
      case CycleState.Finish:
        return 'Ciclo encerrado';
      default:
        return 'Iniciar um ciclo';
    }
  }
}
