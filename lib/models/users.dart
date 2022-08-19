// ignore_for_file: prefer_final_fields, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  Firestore _firestore = Firestore.instance;
  String ref = 'users';

  createUser(Map<String, dynamic> data) {
    _firestore
        .collection(ref)
        .document(data['userId'])
        .setData(data)
        .catchError((e) => {print(e.toString())});
  }
}
