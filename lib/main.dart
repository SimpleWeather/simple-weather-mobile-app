import 'package:flutter/material.dart';
import 'package:flutter_auto_cache/flutter_auto_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/app_module.dart';
import 'core/app_widget.dart';

Future<void> main() async {
  await AutoCacheInitializer.initialize();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
