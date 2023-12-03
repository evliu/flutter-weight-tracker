import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';

  const LoginView({super.key, required this.login});

  final Function() login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[800]!, Colors.blue[400]!],
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
          // Assumption - User only clicks once
          child: ElevatedButton(
            onPressed: login,
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
