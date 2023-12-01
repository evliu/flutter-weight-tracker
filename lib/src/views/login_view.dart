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
        title: const Text('Jasper Weight Tracker'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[800]!, Colors.blue[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[200]!, Colors.blue[700]!],
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: authController.login,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue[800]!,
              fixedSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Login', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
