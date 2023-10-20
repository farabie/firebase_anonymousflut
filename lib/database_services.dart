import 'package:cloud_firestore/cloud_firestore.dart';

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
}
