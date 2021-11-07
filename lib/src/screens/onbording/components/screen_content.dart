import 'package:flutter/material.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.header,
    this.paragraph,
    this.image,
  }) : super(key: key);
  final String? header, paragraph, image;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final ThemeData _theme = Theme.of(context);
    final AppLocalizations? _language = AppLocalizations.of(context);
    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        alignment: Alignment.center,
        image: AssetImage(
          image!,
        ),
      )),
      child: Stack(
        children: [
          Positioned(
            bottom: getProportionateScreenHeight(SizeConfig.screenHeight * 0.2),
            right: 0,
            left: 0,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      header!,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      paragraph!,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
