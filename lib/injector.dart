import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'src/controller/cubits/locale_cubit/locale_cubit.dart';

/*
get_it: a service locator (also dependency injector).
injector (GetIt instance) as we defined it here globally which will hold our dependencies 
and also be responsible of injecting the exact type to the exact place.
*/

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // //############# Dio client ########################
  // injector.registerSingleton<Dio>(Dio());

  // //############# Bloc's ########################
  injector.registerFactory<LocaleCubit>(() => LocaleCubit());
  // injector.registerFactory<AuthenticationBloc>(
  //     () => AuthenticationBloc(injector(), injector(), injector()));
  // //############# Dependancies ########################
  // injector.registerFactory(() => AuthenticationApiService(injector()));
  // injector.registerFactory(
  //     () => AuthenticationRepositoryImp(injector(), injector()));
  // injector.registerSingleton<PreferenceUtils>(PreferenceUtils.getInstance());
  // //############# Usecases ########################
  // injector.registerFactory(() => UserRegisterationUsecase(injector()));
  // injector.registerFactory(() => UserEmailPasswordLoginUscase(injector()));
  // injector.registerFactory(() => UserLogoutUsecase(injector()));
}
