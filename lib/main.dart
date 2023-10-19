import 'package:flutter/material.dart';

void main() {
  runApp(const FirebaseAnonym());
}

class FirebaseAnonym extends StatelessWidget {
  const FirebaseAnonym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Anonymous Firebase"),
        ),
        body: Center(
          child: Text("Demo Anonymous Firebase"),
        ),
      ),
    );
  }
}
