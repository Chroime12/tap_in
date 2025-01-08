// ignore_for_file: use_build_context_synchronously

import 'package:tap_in/features/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthController {
  final AuthService _authService;
  AuthController(this._authService);

  Future<void> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _authService.signIn(email, password);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString().replaceAll('Exception: ', '')),
        ),
      );
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String username,
      required String email,
      required String password}) async {
    try {
      await _authService.signUp(username, email, password);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Account created successfully. Please verify your email'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString().replaceAll('Exception: ', '')),
        ),
      );
    }
  }
}
