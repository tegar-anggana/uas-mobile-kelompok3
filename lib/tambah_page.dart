import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({super.key});

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  // TextEditingController jenisController = TextEditingController();
  String jenisCatatan = "Pemasukkan";
  TextEditingController judulController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ''; // value awal dari text field
    super.initState();
  }

  void aturJenis(String jenis) {
    setState(() {
      jenisCatatan = jenis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
            children: [
              DropdownJenisCatatan(aturJenis: aturJenis),
              TextField(
                controller: dateInput,
                // mengedit controller dari TextField ini
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Masukkan tanggal",
                ),
                readOnly: true, // user tidak bisa mengedit teks nya
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      // DateTime.now() - not to allow to choose before today.
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat("EEEE, d MMMM yyyy", "id_ID")
                            .format(pickedDate);
                    setState(() {
                      dateInput.text =
                          formattedDate; // meng-set nya ke TextField value
                    });
                  } else {}
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: judulController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Judul',
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nominal',
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: deskripsiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Deskripsi',
                ),
                maxLines: 5,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () async {
                  final String tanggal = dateInput.text;
                  final String judul = judulController.text;
                  final String jenis = jenisCatatan;
                  final String deskripsi = deskripsiController.text;
                  final double? nominal =
                      double.tryParse(nominalController.text);
                  await FirebaseFirestore.instance.collection('records').add({
                    "judul": judul,
                    "tanggal": tanggal,
                    "jenis": jenis,
                    "deskripsi": deskripsi,
                    "nominal": nominal,
                  });

                  judulController.text = '';
                  setState(() {
                    dateInput.text = '';
                  });
                  judulController.text = '';
                  deskripsiController.text = '';
                  nominalController.text = '';
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                ),
                child: const Icon(Icons.add, size: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
const List<String> list = <String>['Pemasukkan', 'Pengeluaran'];

class DropdownJenisCatatan extends StatefulWidget {
  const DropdownJenisCatatan({super.key, required this.aturJenis});
  final void Function(String jenis) aturJenis;

  @override
  State<DropdownJenisCatatan> createState() => DropdownJenisCatatanState();
}

class DropdownJenisCatatanState extends State<DropdownJenisCatatan> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        widget.aturJenis(dropdownValue);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
