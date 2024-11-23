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
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          initialData: AuthRequired.none,
          future: sessionViewModel.verifyUserSession(),
          builder: (_, snapshot) {
            final value = snapshot.data;

            if (value == AuthRequired.logged) {
              Modular.to.pushReplacementNamed('../home/');
            }

            if (value == AuthRequired.requiredSignIn) {
              Modular.to.pushReplacementNamed('../auth/');
            }

            return Column(
              children: [
                Center(
                  child: Image.asset('assets/splash.png'),
                ),
              ],
            );
          }),
    );
  }
}
