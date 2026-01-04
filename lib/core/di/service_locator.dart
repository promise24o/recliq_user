import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterSharedPreferences {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
}

@InjectableInit()
Future<void> setupServiceLocator() async {
  await getIt.init();
}
