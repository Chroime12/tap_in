import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tap_in/features/auth/auth_controller.dart';
import 'package:tap_in/features/auth/auth_service.dart';
import 'package:tap_in/features/auth/screens/login_screen.dart';
import 'package:tap_in/features/auth/widgets/action_button.dart';
import 'package:tap_in/features/auth/widgets/text_input.dart';
import 'package:tap_in/utils/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final AuthController registerController = AuthController(AuthService());

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) return;

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      print('Password is not matching');
      return;
    }

    _form.currentState!.save();

    await registerController.signUp(
        context: context,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          // Layout Starts Here
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Add your widgets here
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
                  height: MediaQuery.of(context).size.height * 0.77,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 50),
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
                                  'Sign Up',
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
                            label: 'Username',
                            textController: usernameController,
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                            validator: Validators.validateUsername,
                          ),
                        ),

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

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextInput(
                            label: 'Confirm Password',
                            textController: confirmPasswordController,
                            icon: Icons.lock,
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validators.validatePassword,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, bottom: 40),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: 'By signing up, you agree to our ',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle Terms & Conditions click here
                                          },
                                      ),
                                      const TextSpan(
                                        text: ' and ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle Privacy Policy click here
                                          },
                                      ),
                                    ],
                                  ),
                                  textScaler: const TextScaler.linear(1.05),
                                ),
                              ),
                              // ),
                            ),
                          ],
                        ),

                        SizedBox(
                            width: double.infinity,
                            child: ActionButton(
                                onPressed: _onSubmit,
                                label: 'Sign up',
                                icon: Icons.person_add,
                                loadingLabel: 'Signing up...')),
                        const SizedBox(height: 20.0),

                        Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            children: [
                              TextSpan(
                                text: 'Login',
                                recognizer:
                                    TapGestureRecognizer() // Gesture recognizer for detecting taps
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const LoginScreen()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
