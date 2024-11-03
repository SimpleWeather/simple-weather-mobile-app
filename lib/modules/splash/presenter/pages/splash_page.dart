import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view_model/session_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final sessionViewModel = Modular.get<SessionViewModel>();

  @override
  void initState() {
    sessionViewModel.verifyUserSession();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: sessionViewModel.logged,
          builder: (_, value, __) {
            if (value == AuthRequired.logged) {
              Modular.to.pushReplacementNamed('../home/');
            }

            if (value == AuthRequired.requiredSignIn) {
              Modular.to.pushReplacementNamed('../auth/');
            }

            if (value == AuthRequired.none) {
              return Column(
                children: [
                  Center(
                    child: Image.asset('assets/splash.png'),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          }),
    );
  }
}
