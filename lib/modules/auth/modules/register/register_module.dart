import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../external/datasources/auth_datasource_impl.dart';
import '../../infra/datasources/auth_datasource.dart';
import '../../infra/repositories/auth_repository_impl.dart';
import '../../presenter/auth_page.dart';
import 'domain/usecases/register_user.dart';
import 'presenter/bloc/register_user/register_user_bloc.dart';
import 'presenter/view_models/register_view_model.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthDatasource>(
      AuthDatasourceImpl.new,
    );

    i.add<AuthRepository>(
      AuthRepositoryImpl.new,
    );

    i.add<RegisterUserBloc>(
      RegisterUserBloc.new,
    );

    i.add<RegisterUser>(
      RegisterUserImpl.new,
    );

    i.add<RegisterViewModelImpl>(
      RegisterViewModelImpl.new,
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const AuthPage<RegisterViewModelImpl, RegisterUserBloc>(
        pageTitle: 'Registrar',
        mainButtonText: 'Registrar',
        successNavigationRoute: '../home/',
      ),
    );
    super.routes(r);
  }
}
