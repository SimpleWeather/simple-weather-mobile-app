import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_weather/modules/auth/modules/register/presenter/bloc/register_user/register_user_bloc.dart';

import '../view_models/register_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final viewModel = Modular.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener(
        bloc: viewModel.bloc,
        listener: (_, state) {
          if (state is RegisterUserSuccessState) {
            Modular.to.pushNamed('../home');
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: viewModel.email,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: viewModel.password,
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () => viewModel.register(),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
