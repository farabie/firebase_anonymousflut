import 'package:firebase_anonymousflut/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final User? user;
  const MainPage({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              user!.uid,
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signOut();
              },
              child: Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
