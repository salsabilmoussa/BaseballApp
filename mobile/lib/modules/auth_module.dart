import 'package:baseball_cards_app/auth/pages/login_page.dart';
import 'package:baseball_cards_app/auth/pages/signup_page.dart';
import 'package:baseball_cards_app/auth/service/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) async {
    i.addSingleton(AuthService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/signup', child: (context) => const SignupPage());
  }
}
