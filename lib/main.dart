import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
import 'theme.dart';

/// Entry point of the WMS Mobile app.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// Root widget setting up theme and router.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WMS Mobile',
      theme: buildLightTheme(),
      routerConfig: buildRouter(),
    );
  }
}
