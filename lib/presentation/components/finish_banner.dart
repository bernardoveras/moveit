import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit/shared/styles/colors.dart';

class FinishBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: Duration(milliseconds: 300),
      from: 40,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ganhe 400 xp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.grayLine, thickness: 1.3),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/body.svg',
                  height: 130,
                  width: 130,
                ),
                SizedBox(height: 8),
                Text(
                  'Exercite-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.title,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'É agora bernardo, bora lá meu parça.\nCaminhe por 3 minutos e estique suas pernas\npara você ficar saudável.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            Container(
              width: constraints.maxWidth,
              child: LayoutBuilder(builder: (context, size) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  clipBehavior: Clip.none,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8,
                  children: [
                    Container(
                      width: size.maxWidth / 2 - 8,
                      child: Button(
                        text: 'Falhei',
                        onPressed: () {},
                        backgroundColor: AppColors.red,
                      ),
                    ),
                    Container(
                      width: size.maxWidth / 2 - 8,
                      child: Button(
                        text: 'Completei',
                        onPressed: () {},
                        backgroundColor: AppColors.green,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final BorderRadius? borderRadius;
  final double height;

  const Button({
    Key? key,
    required this.text,
    this.onPressed,
    this.style,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.height = 80,
    this.borderRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return foregroundColor ?? Colors.white;
            }),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return backgroundColor ?? AppColors.blue;
              },
            ),
            elevation: MaterialStateProperty.all(elevation),
            minimumSize: MaterialStateProperty.all(
              Size(double.infinity, height),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
              ),
            ),
          ),
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
