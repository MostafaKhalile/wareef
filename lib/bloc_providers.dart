import 'package:flutter_bloc/flutter_bloc.dart';

import 'injector.dart';
import 'src/controller/cubits/locale_cubit/locale_cubit.dart';

mixin BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LocaleCubit>(create: (_) => injector()),
  ];
}
