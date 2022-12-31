import 'package:flutter/material.dart';
import 'package:kelompok3/catatan_detail_page.dart';

const int itemCount = 20;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.red[50],
                  child: ListTile(
                    title: Text('Item ${(index + 1)}'),
                    subtitle: const Text(
                      'Rp.500.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // debugPrint('Item ${(index + 1)} selected');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const CatatanDetailPage();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
