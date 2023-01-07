import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kelompok3/catatan_detail_page.dart';
import 'package:intl/intl.dart';
import 'package:kelompok3/currency_format.dart';

const int itemCount = 20;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _records =
      FirebaseFirestore.instance.collection('records');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  color: Colors.green[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Total Pemasukkan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "Rp.500.000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.5,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "Total Pengeluaran",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Rp.200.000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.5,
                              color: Color.fromARGB(255, 225, 99, 9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: StreamBuilder(
                stream: _records.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Container(
                          color: Colors.red[50],
                          child: ListTile(
                            title: Text(
                                '${documentSnapshot['judul']} (${CurrencyFormat.convertToIdr(documentSnapshot['nominal'], 0)})'),
                            subtitle: Text(
                              DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                  .format(documentSnapshot['tanggal'].toDate()),
                              // 'Rp.500.000',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              // debugPrint('Item ${(index + 1)} selected');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CatatanDetailPage(
                                        data: documentSnapshot);
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text('mantap');
                  }
                }),
          ),
        ],
      ),
    );
  }
}
