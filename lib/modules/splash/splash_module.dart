import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';
import '../home/home_module.dart';
import 'presenter/pages/splash_page.dart';
import 'presenter/view_model/session_view_model.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.add<SessionViewModel>(
      SessionViewModelImpl.new,
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
    );
    r.module(
      '/auth/',
      module: AuthModule(),
    );
    r.module(
      '/home/',
      module: HomeModule(),
    );
    super.routes(r);
  }
}
