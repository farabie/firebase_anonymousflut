import 'package:firebase_anonymousflut/login_page.dart';
import 'package:firebase_anonymousflut/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);

    return (firebaseUser == null)
        ? LoginPage()
        : MainPage(
            user: firebaseUser,
          );
  }
}
