import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_anonymousflut/auth_services.dart';
import 'package:firebase_anonymousflut/database_services.dart';
import 'package:firebase_anonymousflut/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirebaseAnonym());
}

class FirebaseAnonym extends StatelessWidget {
  const FirebaseAnonym({super.key});

  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   initialData: null,
    //   value: AuthServices.userStream,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cloud Firstore Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  DatabaseServices.createOrUpdateProduct(
                    "2",
                    name: "Pens",
                    price: 10000,
                  );
                },
                child: Text(
                  "Add Data",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  DatabaseServices.createOrUpdateProduct(
                    "1",
                    name: "Pens",
                    price: 200000,
                  );
                },
                child: Text(
                  "Edit Data",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  DocumentSnapshot snapshot =
                      await DatabaseServices.getProduct("1");
                  //snapshot.data['nama'] itu diganti jadi => snapshot.get('nama');
                  print(snapshot.get('nama'));
                  print(snapshot.get('harga'));
                },
                child: Text(
                  "Get Data",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  DatabaseServices.deleteProduct("1");
                },
                child: Text(
                  "Delete Data",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
