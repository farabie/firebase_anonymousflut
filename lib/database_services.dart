import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseServices {
  //Pointer atau collection untuk menujukkan ke collection di cloud firestore
  //Dibuat static agar productionColection itu milik kelas databaseservices bukan si objectnya
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  static Future<void> createOrUpdateProduct(String id,
      {String? name, int? price}) async {
    await productCollection.doc(id).set(
      {
        'nama': name,
        'harga': price,
      },
    );
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.doc(id).get();
  }

  static Future<void> deleteProduct(String id) async {
    return await productCollection.doc(id).delete();
  }

  static Future<String> uploadImage(File imageFile) async {
    //Fungsi untuk mengambil nama file yang akan diupload
    String fileName = path.basename(imageFile.path);

    //Buat reference untuk memasukannya ke firebase storage
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    //Buat fungsi untuk uploadnya
    UploadTask task = ref.putFile(imageFile);
    //Kondisi untuk jika dia selesai diupload
    TaskSnapshot snapshot = await task.whenComplete(() async {
      if (task.snapshot.state == TaskState.success) {
        //Upload Sucessfull
        print("Upload Complete");
        String downloadURL = await ref.getDownloadURL();
        return downloadURL;
      } else {
        throw Exception("Image Upload Failed");
      }
    });

    return await snapshot.ref.getDownloadURL();
  }
}
