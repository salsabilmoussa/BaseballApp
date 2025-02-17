import 'package:baseball_cards_app/home/pages/card_details.dart';
import 'package:baseball_cards_app/home/pages/home_page.dart';
import 'package:baseball_cards_app/home/service/home_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) async {
    i.addSingleton(HomeService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/details', child: (context) => const CardDetails());
  }
}
