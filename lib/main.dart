import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tap_in/app.dart';
import 'package:tap_in/firebase_options.dart';
import 'package:tap_in/themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: const App(),
    );
  }
}
