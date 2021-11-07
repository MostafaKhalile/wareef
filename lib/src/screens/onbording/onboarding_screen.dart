import 'package:flutter/material.dart';
import 'package:wareef/src/core/utils/size_config.dart';

import 'components/body.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "/splash";

  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
