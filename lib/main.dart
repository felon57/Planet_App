import 'package:flutter/material.dart';
import 'package:planet_app/database/database_helper.dart';
import 'package:planet_app/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DatabaseBootstrap(databaseReady: DatabaseHelper.instance.initialize()),
  );
}

class DatabaseBootstrap extends StatelessWidget {
  final Future<void> databaseReady;

  const DatabaseBootstrap({super.key, required this.databaseReady});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      home: FutureBuilder<void>(
        future: databaseReady,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(child: Text('خطا در راه‌اندازی پایگاه داده')),
            );
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
