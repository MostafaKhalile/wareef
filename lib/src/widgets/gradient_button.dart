import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';

typedef ButtonTapCallback = void Function();

class GradientButton extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  final Color gradStart;
  final Color gradEnd;
  final Widget child;
  final ButtonTapCallback onButtonTap;
  const GradientButton({
    required this.radius,
    required this.height,
    required this.width,
    required this.gradStart,
    required this.gradEnd,
    required this.child,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(
        onPressed: onButtonTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: onButtonTap != null
                  ? LinearGradient(
                      colors: [AppColors.kLightGreyColor, Colors.grey[500]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [gradStart, gradEnd],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              borderRadius: BorderRadius.circular(radius)),
          child: Container(
            constraints: const BoxConstraints(minWidth: 50.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
