import 'package:flutter/material.dart';

class CatatanDetailPage extends StatefulWidget {
  const CatatanDetailPage({super.key});

  @override
  State<CatatanDetailPage> createState() => _CatatanDetailPageState();
}

class _CatatanDetailPageState extends State<CatatanDetailPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
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
                children: const [
                  Text(
                    'Jajan Bakso',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    'Rp.500.000',
                    style: TextStyle(
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
                    children: const [
                      Text(
                        'Jenis',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        'Pemasukkan',
                        style: TextStyle(
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
                    children: const [
                      Text(
                        'Tanggal',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        '20 Agustus 2002',
                        style: TextStyle(
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
                children: const [
                  Text(
                    'Deskripsi',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text(
                    '20 Agustus 2002',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ElevatedButton(
              onPressed: () {},
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
