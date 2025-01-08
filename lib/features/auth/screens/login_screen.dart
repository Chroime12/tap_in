import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tap_in/features/auth/auth_service.dart';
import 'package:tap_in/features/auth/auth_controller.dart';
import 'package:tap_in/features/auth/screens/register_screen.dart';
import 'package:tap_in/features/auth/widgets/action_button.dart';
import 'package:tap_in/features/auth/widgets/text_input.dart';
import 'package:tap_in/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController loginController = AuthController(AuthService());

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) return;

    _form.currentState!.save();

    await loginController.signIn(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Image.asset(
                  'assets/logos/AllWhiteLinear.png',
                  height: 180,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        // Title
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Input Field
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextInput(
                            label: 'Email',
                            textController: emailController,
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.validateEmail,
                          ),
                        ),

                        // Input Field
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextInput(
                            label: 'Password',
                            textController: passwordController,
                            icon: Icons.lock,
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validators.validatePassword,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle forgot password logic here
                              },
                              child: const Text(
                                'Forgot Password?',
                              ),
                            ),
                          ],
                        ),

                        // Button Login
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: ActionButton(
                              onPressed: _submit,
                              label: 'Sign in',
                              icon: Icons.login),
                        ),

                        const SizedBox(height: 20.0),
                        Text.rich(
                          TextSpan(
                            text: 'New to Tap In? ',
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                recognizer:
                                    TapGestureRecognizer() // Gesture recognizer for detecting taps
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const RegisterScreen()));
                                      },
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
