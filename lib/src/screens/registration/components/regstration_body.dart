import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/custom_snackbar.dart';
import 'package:wareef/src/core/utils/keyboard_unit.dart';
import 'package:wareef/src/core/utils/size_config.dart';
import 'package:wareef/src/core/utils/validation.dart';
import 'package:wareef/src/screens/registration/components/profile_picture_picker.dart';
import 'package:wareef/src/widgets/circula_text_field.dart';
import 'package:wareef/src/widgets/gradient_button.dart';
import 'package:wareef/src/widgets/subheader.dart';
import 'package:wareef/wareef_icons.dart';

import '../registration_screen.dart';

class RegstrationBody extends StatefulWidget {
  const RegstrationBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RegstrationBody> createState() => _RegstrationBodyState();
}

class _RegstrationBodyState extends State<RegstrationBody> {
  final _regstrationFormKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _additionalInfoController =
      TextEditingController();

  bool? agreement = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    AppLocalizations? _language = AppLocalizations.of(context);

    return Container(
        height: SizeConfig.screenHeight * 0.7,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: _theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: SizeConfig.screenHeight * -0.10,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    const ProfilePicturePicker(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        _language!.translate(
                            "registrationScreen", "your_profile_picture")!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        _language.translate(
                            "registrationScreen", "shouldnot_exceed_5_mega")!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 110, 30, 0),
              child: Form(
                key: _regstrationFormKey,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CircularTextField(
                          controller: _firstNameController,
                          validation: Validator().isValidUsername,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Icon(
                              WareefIcons.user,
                              color: AppColors.kLightGreyColor,
                              size: 15,
                            ),
                          ),
                          label: _language.translate("inputLabels", "name"),
                          hint: _language.translate("inputHints", "name"),
                        ),
                      ),
                      CircularTextField(
                        controller: _addressController,
                        validation: Validator().isMandatory,
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: AppColors.kLightGreyColor,
                        ),
                        suffixIcon: const Icon(
                          WareefIcons.location,
                          color: AppColors.kLightGreyColor,
                          size: 15,
                        ),
                        label: _language.translate("inputLabels", "address"),
                        hint: _language.translate("inputHints", "address"),
                      ),
                      CircularTextField(
                        controller: _emailController,
                        validation: Validator().isValidEmail,
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: AppColors.kLightGreyColor,
                        ),
                        label: _language.translate("inputLabels", "email"),
                        hint: _language.translate("inputHints", "email"),
                      ),
                      SubHeader(
                          text: _language.translate(
                              "registrationScreen", "gender")!),
                      GenderChoiceChips(
                        genders: [
                          AppLocalizations.of(context)!
                              .translate("registrationScreen", "male")!,
                          AppLocalizations.of(context)!
                              .translate("registrationScreen", "female")!
                        ],
                      ),
                      SubHeader(
                          text: _language.translate(
                              "registrationScreen", "additional_info")!),
                      CircularTextField(
                        controller: _additionalInfoController,
                        validation: (value) => null,
                        minLines: 3,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                      ),
                      Center(
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: AppColors.kPrimaryColor,
                          title: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: "GESSTwo",
                                  color: AppColors.kDarkTextColor,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: _language.translate(
                                      "mobileLogin", "I_agree")!,
                                  style: const TextStyle(
                                      color: AppColors.kDarkTextColor),
                                ),
                                TextSpan(
                                  text: _language.translate("mobileLogin",
                                      "the_conditions_and_the_terms")!,
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
                          onChanged: (value) {
                            setState(() {
                              agreement = value;
                            });
                          },
                          value: agreement,
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
                            if (agreement!) {
                              if (_regstrationFormKey.currentState!
                                  .validate()) {
                                KeyboardUtil.hideKeyboard(context);

                                Snackbar().showConfirmSnackBar(
                                    context,
                                    _language.translate(
                                        "confirmations", "confirmed_info")!);
                                // Navigator.pushNamed(
                                //     context, RegistrationScreen.routeName);
                              }
                            } else {
                              Snackbar().showErrorSnackBar(
                                  context,
                                  _language.translate("errorMessages",
                                      "you_should_agree_conditions")!);
                            }
                          },
                          width: SizeConfig.screenWidth * .8,
                          child: Text(
                            _language.translate("authentication", "register")!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 50),
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 0.8,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                                _language.translate("onboarding", "skip")!),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: AppColors.kPrimaryColor)),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                    const StadiumBorder(
                                        side: BorderSide(
                                            color: AppColors.kPrimaryColor)))),
                          ),
                        ),
                      )
                    ])),
              ),
            ),
          ],
        ));
  }
}

class GenderChoiceChips extends StatefulWidget {
  const GenderChoiceChips({
    Key? key,
    required this.genders,
  }) : super(key: key);
  final List<String>? genders;
  @override
  State<GenderChoiceChips> createState() => _GenderChoiceChipsState();
}

class _GenderChoiceChipsState extends State<GenderChoiceChips> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      children: List<Widget>.generate(
        2,
        (int index) {
          return ChoiceChip(
            pressElevation: 0.0,
            shape: _value == index
                ? null
                : const StadiumBorder(
                    side: BorderSide(color: AppColors.kPrimaryColor)),
            selectedColor: AppColors.kPrimaryColor,
            labelStyle: TextStyle(
                color: _value == index ? Colors.white : Colors.black,
                fontSize: 16),
            backgroundColor: Colors.grey[100],
            labelPadding: const EdgeInsets.symmetric(horizontal: 50),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.genders![index]),
            ),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
