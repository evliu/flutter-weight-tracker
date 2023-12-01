import 'package:flutter/material.dart';

import '../authentication/auth_controller.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';

  const LoginView({
    super.key,
    required this.authController,
  });

  final AnonymousAuthController authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Jasper Weight Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: authController.login,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
