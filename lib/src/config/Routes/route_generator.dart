import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wareef/src/screens/mobileLogin/mobile_login_screen.dart';
import 'package:wareef/src/screens/onbording/onboarding_screen.dart';
import 'package:wareef/src/screens/pinCodeScreen/pin_code_screen.dart';
import 'package:wareef/src/screens/registration/registration_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case OnboardingScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const OnboardingScreen());
      case MobileLogin.routeName:
        return MaterialPageRoute(builder: (_) => const MobileLogin());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case PinCodeScreen.routeName:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => PinCodeScreen(
                  phoneNumber: args as String,
                ));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR')),
      );
    });
  }
}
