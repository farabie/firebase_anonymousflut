import 'package:firebase_anonymousflut/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthServices.signInWithAnonymous();
          },
          child: Text(
            "Sign In With Anonymous",
          ),
        ),
      ),
    );
  }
}
