import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';

class GradientButton extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  final Color gradStart;
  final Color gradEnd;
  final Widget child;
  final VoidCallback? onButtonTap;
  const GradientButton({
    Key? key,
    required this.radius,
    required this.height,
    required this.width,
    required this.gradStart,
    required this.gradEnd,
    required this.child,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: onButtonTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: onButtonTap != null
                  ? LinearGradient(
                      colors: [gradStart, gradEnd],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    )
                  : LinearGradient(
                      colors: [AppColors.kLightGreyColor, Colors.grey[500]!],
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
