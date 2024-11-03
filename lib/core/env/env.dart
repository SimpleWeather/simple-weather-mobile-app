import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'API_KEY',
    obfuscate: true,
  )
  static String apiKey = _Env.apiKey;

  @EnviedField(
    varName: 'SUPABASE_PASSWORD',
    obfuscate: true,
  )
  static String supabasePassword = _Env.supabasePassword;

  @EnviedField(
    varName: 'SUPABASE_ROW_LEVEL_SECURITY_KEY',
    obfuscate: true,
  )
  static String supabaseRowLevelSecurityKey = _Env.supabaseRowLevelSecurityKey;

  @EnviedField(
    varName: 'SUPABASE_URL',
    obfuscate: true,
  )
  static String supabaseUrl = _Env.supabaseUrl;
}
