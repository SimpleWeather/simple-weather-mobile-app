import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'domain/repositories/auth_repository.dart';
import 'external/datasources/auth_datasource_impl.dart';
import 'infra/datasources/auth_datasource.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthDatasource>(
      AuthDatasourceImpl.new,
    );

    i.add<AuthRepository>(
      AuthRepositoryImpl.new,
    );

    super.binds(i);
  }

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
