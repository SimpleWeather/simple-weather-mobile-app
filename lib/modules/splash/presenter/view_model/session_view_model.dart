import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthRequired {
  none,
  logged,
  requiredSignIn,
}

abstract class SessionViewModel {
  abstract final ValueNotifier<AuthRequired> logged;

  Future<void> verifyUserSession();
}

class SessionViewModelImpl implements SessionViewModel {
  @override
  final ValueNotifier<AuthRequired> logged = ValueNotifier(AuthRequired.none);

  @override
  Future<void> verifyUserSession() async {
    final auth = Supabase.instance.client.auth;
    final session = auth.currentSession;

    if (session != null) {
      if (!session.isExpired) {
        logged.value = AuthRequired.logged;

        if (kDebugMode) {
          print('Entrou como ${session.user.email} - ${session.user.id}');
          print(
              'Sessão expira em ${((session.expiresIn ?? 0) / 60).round()} minutos');
        }

        return;
      }
    }

    logged.value = AuthRequired.requiredSignIn;
  }
}
