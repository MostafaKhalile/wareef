import 'package:flutter/material.dart';
import 'package:wareef/src/core/utils/size_config.dart';

import 'components/regstration_body.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/Registration';
  const RegistrationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              width: _size.width,
              height: _size.height,
              child: Stack(
                children: const [
                  RegisrationBackground(),
                  TopRightLogo(),

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: RegstrationBody()),

                  // Body(size: _size, theme: _theme)
                ],
              ))),
    );
  }
}

class TopRightLogo extends StatelessWidget {
  const TopRightLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(30.0)),
            child: Image.asset(
              'assets/imgs/logo.png',
              height: getProportionateScreenHeight(60),
            ),
          )
        ],
      ),
    );
  }
}

class RegisrationBackground extends StatelessWidget {
  const RegisrationBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/imgs/background.png")),
      ),
    );
  }
}
