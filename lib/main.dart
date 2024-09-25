import 'package:bar_client/core_ui/lib/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'navigation/app_router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: lightTheme,
    );
  }
}
