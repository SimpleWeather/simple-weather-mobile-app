import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: RegisterModule(),
    );

    r.module(
      '/login',
      module: LoginModule(),
    );

    r.module(
      '/home',
      module: HomeModule(),
    );

    super.routes(r);
  }
}
