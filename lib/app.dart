import 'package:flutter/material.dart';
import 'package:wareef/src/screens/onbording/onboarding_screen.dart';

import 'src/config/Routes/route_generator.dart';
import 'src/config/themes/theme.dart';
import 'src/controller/cubits/locale_cubit/locale_cubit.dart';

class App extends StatelessWidget {
  const App(
      {required this.localizationsDelegates,
      required this.localeState,
      required Key key})
      : super(key: key);

  final List<LocalizationsDelegate<Object>> localizationsDelegates;
  final LocaleState localeState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wareef",
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', ''),
      ],
      locale: const Locale('ar', ''),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: OnboardingScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
