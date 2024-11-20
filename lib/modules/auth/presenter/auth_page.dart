import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/widgets/custom_snackbar.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'view_models/auth_view_model.dart';
import 'widgets/auth_input_widget.dart';

class AuthPage<TViewModel extends AuthViewModel, TBloc extends AuthBloc>
    extends StatefulWidget {
  final String pageTitle;
  final String mainButtonText;
  final String successNavigationRoute;
  final String? secondaryButtonText;
  final String? secondaryButtonNavigationRoute;

  const AuthPage({
    super.key,
    required this.pageTitle,
    required this.mainButtonText,
    required this.successNavigationRoute,
    this.secondaryButtonText,
    this.secondaryButtonNavigationRoute,
  });

  @override
  State<AuthPage> createState() => _AuthPageState<TViewModel, TBloc>();
}

class _AuthPageState<TViewModel extends AuthViewModel, TBloc extends AuthBloc>
    extends State<AuthPage<TViewModel, TBloc>> {
  late final viewModel = Modular.get<TViewModel>();
  late final bloc = Modular.get<TBloc>();

  void auth() => bloc.add(
        AuthSessionEvent(
          email: viewModel.email.text,
          password: viewModel.password.text,
        ),
      );

  bool get buttonIsEnabled => viewModel.buttonIsEnabled;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.pageTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: BlocListener(
          bloc: bloc,
          listener: (_, state) {
            if (state is AuthErrorState) {
              showCustomSnackBarWidget(
                context: context,
                prefix: 'Falha na autenticação!\n',
                message: state.message,
                backgroundColor: Colors.red,
                icon: Icons.warning_amber,
              );
            }

            if (state is AuthSuccessState) {
              showCustomSnackBarWidget(
                context: context,
                message: 'Autenticado com sucesso!',
                backgroundColor: Colors.green,
              );

              Modular.to.pushReplacementNamed(
                widget.successNavigationRoute,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                AuthInputWidget(
                  controller: viewModel.email,
                  label: 'Email',
                  hint: 'Ex: user@mailprovider.com',
                ),
                const SizedBox(height: 20),
                AuthInputWidget(
                  controller: viewModel.password,
                  hasObscureText: true,
                  label: 'Senha',
                  hint: 'Senha de usuário',
                ),
                const SizedBox(height: 80),
                AnimatedBuilder(
                    animation: Listenable.merge([
                      viewModel.email,
                      viewModel.password,
                    ]),
                    builder: (context, _) {
                      return ElevatedButton(
                        onPressed: () => auth(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            buttonIsEnabled
                                ? Colors.blueAccent
                                : Colors.grey[300],
                          ),
                        ),
                        child: Text(
                          widget.mainButtonText,
                          style: TextStyle(
                            color: buttonIsEnabled
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }),
                if (widget.secondaryButtonText != null &&
                    widget.secondaryButtonNavigationRoute != null)
                  TextButton(
                    onPressed: () {
                      viewModel
                        ..email.clear()
                        ..password.clear();

                      Modular.to.pushNamed(
                        widget.secondaryButtonNavigationRoute!,
                      );
                    },
                    child: Text(
                      widget.secondaryButtonText!,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
