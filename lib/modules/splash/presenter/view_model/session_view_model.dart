import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthRequired {
  none,
  logged,
  requiredSignIn,
}

abstract class SessionViewModel {
  Future<AuthRequired> verifyUserSession();
}

class SessionViewModelImpl implements SessionViewModel {
  @override
  Future<AuthRequired> verifyUserSession() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session == null) {
      return AuthRequired.requiredSignIn;
    }

    if (!session.isExpired) {
      if (kDebugMode) {
        print('Entrou como ${session.user.email} - ${session.user.id}');
        print(
            'Sessão expira em ${((session.expiresIn ?? 0) / 60).round()} minutos');
      }

      return AuthRequired.logged;
    }

    return AuthRequired.none;
  }
}
