import 'package:flutter/material.dart';
import 'package:wareef/src/core/utils/size_config.dart';

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
                    child: Container(
                      height: _size.height * 0.7,
                      width: _size.width,
                      decoration: BoxDecoration(
                          color: _theme.scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                    ),
                  )
                ],
              ))),
    );
  }
}

//Salon Cover Image in the background
class SalonCoverImage extends StatelessWidget {
  const SalonCoverImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Positioned(
      top: -_size.height * .25,
      child: Container(
        width: _size.width,
        height: _size.height * 0.9,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/imgs/background.png")),
        ),
      ),
    );
  }
}
