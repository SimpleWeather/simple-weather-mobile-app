import 'package:flutter_modular/flutter_modular.dart';

import '../modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: SplashModule(),
    );
    super.routes(r);
  }
}
