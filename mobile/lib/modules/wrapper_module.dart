import 'package:baseball_cards_app/modules/auth_module.dart';
import 'package:baseball_cards_app/modules/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WrapperModule extends Module {
  @override
  void binds(Injector i) async {}

  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
    r.module('/home/', module: HomeModule());
  }
}
