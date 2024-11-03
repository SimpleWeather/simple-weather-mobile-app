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
      appBar: AppBar(
        title: const Text(
          'Cadastrar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocListener(
        bloc: viewModel.bloc,
        listener: (_, state) {
          if (state is RegisterUserSuccessState) {
            Modular.to.pushReplacementNamed('../home/');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: viewModel.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Ex: user@mailprovider.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: viewModel.password,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Senha de usuário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              AnimatedBuilder(
                  animation: Listenable.merge([
                    viewModel.email,
                    viewModel.password,
                  ]),
                  builder: (context, _) {
                    return ElevatedButton(
                      onPressed: () => viewModel.register(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          viewModel.buttonEnabled
                              ? Colors.blueAccent
                              : Colors.grey[300],
                        ),
                      ),
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: viewModel.buttonEnabled
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
            ],
          ),
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
