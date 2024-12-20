import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _textboxNama(),
            const SizedBox(height: 20),
            _textboxNIM(),
            const SizedBox(height: 20),
            _textboxTahun(),
            const SizedBox(height: 20),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.purple[50],
        filled: true,
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.blue[50],
        filled: true,
        labelStyle: const TextStyle(color: Colors.blue),
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.green[50],
        filled: true,
        labelStyle: const TextStyle(color: Colors.green),
      ),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, // To avoid shadow mismatches
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text('Simpan', style: TextStyle(fontSize: 16)),
      ),
    );
  }

}
