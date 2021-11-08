import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/constants.dart';
import 'package:wareef/src/core/utils/size_config.dart';
import 'package:wareef/src/core/utils/validation.dart';
import 'package:wareef/src/widgets/gradient_button.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required Size size,
    required ThemeData theme,
  })  : _size = size,
        _theme = theme,
        super(key: key);

  final Size _size;
  final ThemeData _theme;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _mobileFormKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();
  String mobile = "";
  @override
  Widget build(BuildContext context) {
    AppLocalizations? _language = AppLocalizations.of(context);
    return Form(
      key: _mobileFormKey,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: widget._size.height * 0.7,
          width: widget._size.width,
          decoration: BoxDecoration(
              color: widget._theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _language!
                      .translate("mobileLogin", "we_will_send_verify_code")!,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: SizeConfig.screenWidth * 0.5,
                        child: TextFormField(
                          style: const TextStyle(fontFamily: "SegoeUI"),
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          onSaved: (Value) => mobile = Value!,
                          validator: Validator().isSaudiphoneNumber,
                          decoration: const InputDecoration(
                              hintText: "123456789",
                              prefixIcon: Icon(
                                Icons.phone_android_rounded,
                              )),
                        )),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            width: 2.0,
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid),
                      )),
                      child: Row(
                        children: [
                          const Text(
                            "966 +",
                            style: TextStyle(
                                fontFamily: "SegoeUI",
                                color: AppColors.kLightGreyColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(ksaFlag),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GradientButton(
                  gradEnd: AppColors.kPrimaryGradientEnd,
                  gradStart: AppColors.kPrimaryGradientStart,
                  height: 50,
                  radius: 30,
                  onButtonTap: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_mobileFormKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: AppColors.kGreenColor,
                            content: Text(_language.translate(
                                "confimations", "processing_login")!)),
                      );
                    }
                  },
                  width: SizeConfig.screenWidth * .8,
                  child: Text(
                    _language.translate("onboarding", "login")!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextButton(
                  child: Text(
                    _language.translate("onboarding", "skip")!,
                    style: widget._theme.textTheme.button!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w200),
                  ),
                  onPressed: () => print("Skip"),
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                ),
              ),
              const Spacer(),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontFamily: "GESSTwo",
                        color: AppColors.kDarkTextColor,
                        height: 1.5),
                    children: [
                      TextSpan(
                        text: _language.translate(
                            "mobileLogin", "by_tap_login_I_confirm_that")!,
                        style: const TextStyle(color: AppColors.kDarkTextColor),
                      ),
                      TextSpan(
                        text: _language.translate(
                            "mobileLogin", "conditions_and_terms")!,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.kTextGreyColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("link");
                          },
                      ),
                      TextSpan(
                        text: _language.translate(
                            "mobileLogin", "inaddition_to")!,
                        style: const TextStyle(color: AppColors.kDarkTextColor),
                      ),
                      TextSpan(
                        text: _language.translate(
                            "mobileLogin", "privacy_policy")!,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.kTextGreyColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("link");
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
