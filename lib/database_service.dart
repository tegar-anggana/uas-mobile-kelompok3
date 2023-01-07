import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  List recordsList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("records");

  Future getData() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          recordsList.add(result.data());
        }
      });

      return recordsList;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }
}
