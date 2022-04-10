import 'package:flutter/material.dart';

import 'components/body.dart';

class MobileLogin extends StatelessWidget {
  static const String routeName = '/mobile_login';
  const MobileLogin({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    ThemeData _theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              width: _size.width,
              height: _size.height,
              child: Stack(
                children: [
                  Container(
                    width: _size.width,
                    height: _size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/imgs/background.png")),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset("assets/imgs/logo.png"),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Body(size: _size, theme: _theme))
                ],
              ))),
    );
  }
}
