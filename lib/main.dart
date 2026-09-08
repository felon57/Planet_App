

// main.dart — Application entry and root widget
// - main(): entry point that calls runApp(MyApp()) to start the Flutter engine.
// - MyApp: StatelessWidget that provides the top-level MaterialApp configuration
//   (title, debug banner, and the initial home route which is SplashScreen).
// This file boots the app; keep it small and delegate UI to screens/.

import 'package:flutter/material.dart';

import 'package:planet_app/screens/splash_screen.dart';

/// Bootstraps the Flutter app and launches the widget tree.
void main() {
  runApp(const MyApp());
}

/// Root widget that wraps the entire app in a [MaterialApp].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      home: SplashScreen(),
    );
  }
}
