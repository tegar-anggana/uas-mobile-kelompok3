import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text("Hapus Seluruh Data Catatan"),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Batal"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Hapus",
      style: TextStyle(color: Colors.red),
    ),
    onPressed: () {
      FirebaseFirestore.instance
          .collection('records')
          .snapshots()
          .forEach((querySnapshot) {
        for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
          docSnapshot.reference.delete();
        }
      });
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Hapus Seluruh Catatan"),
    content: const Text("Yakin ingin menghapus seluruh catatan?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
