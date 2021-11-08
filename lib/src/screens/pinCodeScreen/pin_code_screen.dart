import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:wareef/src/config/Colors/colors.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/size_config.dart';
import 'package:wareef/src/widgets/gradient_button.dart';

class PinCodeScreen extends StatefulWidget {
  static const String routeName = "/pinCode";
  const PinCodeScreen({
    Key? key,
  }) : super(key: key);
  @override
  _PinCodepagestate createState() => _PinCodepagestate();
}

class _PinCodepagestate extends State<PinCodeScreen> {
  bool _onEditing = true;
  bool _resend = false;
  String _code = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _language = AppLocalizations.of(context);
    final _theme = Theme.of(context);
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: AppColors.kLighterGreyColor,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenHeight(30.0)),
                          child: Image.asset(
                            'assets/imgs/logo.png',
                            height: getProportionateScreenHeight(60),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            _language!.translate("registrationScreen",
                                "shouldnot_exceed_5_mega")!,
                            style: _theme.textTheme.headline6!.copyWith(
                                color: AppColors.kDarkTextColor, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: VerificationCode(
                              textStyle: const TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              itemSize: size.width * 0.2,
                              underlineColor: Theme.of(context).primaryColor,
                              clearAll: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'مسح الكود',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              onCompleted: (value) {
                                setState(() {
                                  _code = value;
                                });
                              },
                              onEditing: (bool value) {
                                setState(() {
                                  _onEditing = value;
                                });
                                if (!_onEditing) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                          ),
                          if (!_resend)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _language.translate("registrationScreen",
                                      "shouldnot_exceed_5_mega")!,
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.headline6!.copyWith(
                                      color: AppColors.kDarkTextColor,
                                      fontSize: 16),
                                ),
                                TweenAnimationBuilder(
                                  tween: Tween(begin: 30.0, end: 0.0),
                                  duration: const Duration(seconds: 30),
                                  builder: (_, dynamic value, child) => Text(
                                    "00:${value.toInt()} ثانية",
                                    style: _theme.textTheme.headline6!.copyWith(
                                        color: AppColors.kDarkTextColor,
                                        fontSize: 16),
                                  ),
                                  onEnd: () {
                                    setState(() {
                                      _resend = true;
                                    });
                                  },
                                ),
                              ],
                            )
                          else
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _resend = false;
                                  });
                                },
                                child: Text(_language.translate(
                                    "registrationScreen",
                                    "shouldnot_exceed_5_mega")!)),
                          const SizedBox(
                            height: 15,
                          ),
                          GradientButton(
                            width: double.infinity,
                            onButtonTap: () {
                              if (_code == "1111") {
                                print("Confirmed");
                              }
                            },
                            gradEnd: AppColors.kPrimaryGradientEnd,
                            gradStart: AppColors.kPrimaryGradientStart,
                            height: 50,
                            radius: 30,
                            child: Text(
                              _language.translate("registrationScreen",
                                  "shouldnot_exceed_5_mega")!,
                              style: _theme.textTheme.button,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ])))),
        )
      ],
    ));
  }
}
