import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_in/features/auth/screens/login_screen.dart';
import 'package:tap_in/features/home/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        Widget child;

        if (snapshot.connectionState == ConnectionState.waiting) {
          child = const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          child = const HomeScreen();
        } else {
          child = const LoginScreen();
        }

        return PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: child,
        );
      },
    );
  }
}
