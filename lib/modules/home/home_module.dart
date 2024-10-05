import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
    );
    super.routes(r);
  }
}
