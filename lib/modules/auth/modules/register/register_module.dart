import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/register_user.dart';
import 'presenter/bloc/register_user/register_user_bloc.dart';
import 'presenter/pages/register_page.dart';
import 'presenter/view_models/register_view_model.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.add<RegisterUserBloc>(
      RegisterUserBloc.new,
    );

    i.add<RegisterUser>(
      RegisterUserImpl.new,
    );

    i.add<RegisterViewModel>(
      RegisterViewModelImpl.new,
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const RegisterPage(),
    );
    super.routes(r);
  }
}
