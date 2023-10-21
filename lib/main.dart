import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_anonymousflut/auth_services.dart';
import 'package:firebase_anonymousflut/database_services.dart';
import 'package:firebase_anonymousflut/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirebaseAnonym());
}

class FirebaseAnonym extends StatefulWidget {
  const FirebaseAnonym({super.key});

  @override
  State<FirebaseAnonym> createState() => _FirebaseAnonymState();
}

class _FirebaseAnonymState extends State<FirebaseAnonym> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Storage Demo"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (imagePath != null)
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            image: NetworkImage(imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Text("Sign In"),
                  onPressed: () async {
                    AuthServices.signInWithAnonymous();
                  },
                ),
                ElevatedButton(
                  child: Text("Upload Image"),
                  onPressed: () async {
                    File? file = await getImage();
                    imagePath = await DatabaseServices.uploadImage(file!);

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<File?> getImage() async {
  XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (XFile != null) {
    //Convert XFile to File
    File file = File(xFile!.path);
    return file;
  }
  return null;
}


    // return StreamProvider.value(
    //   initialData: null,
    //   value: AuthServices.userStream,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Cloud Firstore Demo"),
    //     ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           ElevatedButton(
    //             onPressed: () {
    //               DatabaseServices.createOrUpdateProduct(
    //                 "2",
    //                 name: "Pens",
    //                 price: 10000,
    //               );
    //             },
    //             child: Text(
    //               "Add Data",
    //             ),
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               DatabaseServices.createOrUpdateProduct(
    //                 "1",
    //                 name: "Pens",
    //                 price: 200000,
    //               );
    //             },
    //             child: Text(
    //               "Edit Data",
    //             ),
    //           ),
    //           ElevatedButton(
    //             onPressed: () async {
    //               DocumentSnapshot snapshot =
    //                   await DatabaseServices.getProduct("1");
    //               //snapshot.data['nama'] itu diganti jadi => snapshot.get('nama');
    //               print(snapshot.get('nama'));
    //               print(snapshot.get('harga'));
    //             },
    //             child: Text(
    //               "Get Data",
    //             ),
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               DatabaseServices.deleteProduct("1");
    //             },
    //             child: Text(
    //               "Delete Data",
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );