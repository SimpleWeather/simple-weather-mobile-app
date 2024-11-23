import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../external/datasources/auth_datasource_impl.dart';
import '../../infra/datasources/auth_datasource.dart';
import '../../infra/repositories/auth_repository_impl.dart';
import '../../presenter/auth_page.dart';
import 'domain/usecases/login_user.dart';
import 'presenter/bloc/login_bloc.dart';
import 'presenter/view_models/login_view_model.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthDatasource>(
      AuthDatasourceImpl.new,
    );

    i.add<AuthRepository>(
      AuthRepositoryImpl.new,
    );

    i.add<LoginBloc>(
      LoginBloc.new,
    );

    i.add<LoginViewModel>(
      LoginViewModel.new,
    );

    i.add<LoginUser>(
      LoginUserImpl.new,
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const AuthPage<LoginViewModel, LoginBloc>(
        pageTitle: 'Login',
        mainButtonText: 'Entrar',
        successNavigationRoute: '../home/',
        secondaryButtonText: 'Não possuo uma conta. Cadastrar.',
        secondaryButtonNavigationRoute: './register',
      ),
    );
    super.routes(r);
  }
}
