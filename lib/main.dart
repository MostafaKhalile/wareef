import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app.dart';
import 'bloc_providers.dart';
import 'injector.dart';
import 'src/config/localization/app_localizations_delegates.dart';
import 'src/controller/cubits/locale_cubit/locale_cubit.dart';
import 'src/core/utils/app_bloc_observer.dart';
import 'src/core/utils/shared_perfs_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  PreferenceUtils.init();
  initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (_, localeState) {
          return App(
            localizationsDelegates: localizationsDelegates,
            localeState: localeState,
            key: const Key('App'),
          );
        },
      ),
    );
  }
}
