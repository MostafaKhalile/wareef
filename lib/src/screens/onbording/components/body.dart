import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/constants.dart';
import 'package:wareef/src/core/utils/size_config.dart';

// This is the best practice
import '../../mobileLogin/mobile_login_screen.dart';
import 'screen_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> screenContent(BuildContext context) => [
        {
          "header": AppLocalizations.of(context)!
              .translate("onboarding", "add_you_offer")!,
          "paragraph": AppLocalizations.of(context)!
              .translate("onboarding", "select_your_location_on_map")!,
          "image": "assets/imgs/splash_1.png"
        },
        {
          "header": AppLocalizations.of(context)!
              .translate("onboarding", "share_on_social_networks")!,
          "paragraph": AppLocalizations.of(context)!
              .translate("onboarding", "find_us_any_time_any_where")!,
          "image": "assets/imgs/splash_2.png"
        },
        {
          "header": AppLocalizations.of(context)!
              .translate("onboarding", "track_your_offers")!,
          "paragraph": AppLocalizations.of(context)!
              .translate("onboarding", "save_your_time")!,
          "image": "assets/imgs/splash_3.png"
        },
      ];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      screenContent(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final AppLocalizations? _language = AppLocalizations.of(context);
    List<Map<String, String>> splashData = screenContent(context);
    return SafeArea(
      child: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  SplashContent(
                    image: splashData[index]["image"],
                    header: splashData[index]['header'],
                    paragraph: splashData[index]['paragraph'],
                  ),
                  Positioned(
                    bottom: getProportionateScreenHeight(
                        SizeConfig.screenHeight * 0.10),
                    right: 0,
                    left: 0,
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                            size: SizeConfig.defaultSize,
                          ),
                          Text(
                            (index < splashData.length - 1)
                                ? _language!.translate("onboarding", "skip")!
                                : _language!.translate("onboarding", "login")!,
                            style: _theme.textTheme.button!,
                          ),
                        ],
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, MobileLogin.routeName),
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(30.0)),
                    child: Image.asset(
                      'assets/imgs/flat_logo.png',
                      height: getProportionateScreenHeight(60),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom:
                  getProportionateScreenHeight(SizeConfig.screenHeight * 0.3),
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => buildDot(index: index),
                ).reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 15),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.kPrimaryColor
            : AppColors.kPrimaryColorLight,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
