import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final prefs = await SharedPreferences.getInstance();

    final session = Session.fromJson(
      jsonDecode(prefs.getString('user_session') ?? ''),
    );

    if (session != null) {
      if (!session.isExpired) {
        logged.value = AuthRequired.logged;
        return;
      }
    }

    (await SharedPreferences.getInstance()).setString('user_session', '');
    logged.value = AuthRequired.requiredSignIn;
  }
}
