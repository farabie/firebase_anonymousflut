import 'package:firebase_anonymousflut/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: passwordController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signInWithAnonymous();
              },
              child: Text(
                "Sign In With Anonymous",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signIn(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text(
                "Sign In",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signUp(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text(
                "Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
