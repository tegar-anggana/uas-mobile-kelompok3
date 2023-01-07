import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kelompok3/currency_format.dart';
import 'package:kelompok3/edit_page.dart';
import 'package:intl/intl.dart';

class CatatanDetailPage extends StatefulWidget {
  const CatatanDetailPage({super.key, required this.data});

  final DocumentSnapshot data;

  @override
  State<CatatanDetailPage> createState() => _CatatanDetailPageState();
}

class _CatatanDetailPageState extends State<CatatanDetailPage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.data['judul']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
        actions: [
          IconButton(
            onPressed: () {
              // debugPrint('Actions');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return EditPage(data: widget.data);
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.lightGreen[100],
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey[400],
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    widget.data['judul'],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    CurrencyFormat.convertToIdr(widget.data['nominal'], 2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.blueGrey,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jenis',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        widget.data['jenis'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.blueGrey,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tanggal',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        widget.data['tanggal'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.blueGrey,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text(
                    widget.data['deskripsi'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('records')
                    .doc(widget.data.id)
                    .delete();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                padding: const EdgeInsets.all(12),
              ),
              child: const Icon(
                Icons.delete_outline,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
