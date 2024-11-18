# Tugas 2 Praktikum 2024

Proses Passing Data dari Form Menuju Tampilan
Aplikasi ini memanfaatkan dua halaman utama, FormData sebagai form input dan TampilData sebagai halaman tampilan data. Data dari pengguna diambil melalui form input dan dikirim ke halaman tampilan menggunakan mekanisme Navigator.

Form Input (FormData)
Halaman FormData memiliki form yang terdiri dari tiga elemen input, yaitu:

Nama
NIM
Tahun Lahir
Form ini menggunakan TextEditingController untuk mengelola data dari input pengguna. Setiap TextField memiliki controller masing-masing:

```
final _namaController = TextEditingController();
final _nimController = TextEditingController();
final _tahunController = TextEditingController();
```
Ketika pengguna mengetikkan data, controller akan menyimpan nilai tersebut. Saat tombol "Simpan" ditekan, data dari controller diambil menggunakan properti .text:
```
String nama = _namaController.text;
String nim = _nimController.text;
int tahun = int.parse(_tahunController.text);
```
Setelah data berhasil diambil, Navigator.push digunakan untuk mengirimkan data ini ke halaman TampilData:
```
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) =>
      TampilData(nama: nama, nim: nim, tahun: tahun),
  ),
);
```
Halaman Tampilan Data (TampilData)
Halaman ini bertugas menerima data yang dikirim dari FormData dan menampilkannya.

Menerima Data Data dikirimkan dari FormData ke TampilData melalui konstruktor dengan parameter wajib nama, nim, dan tahun:
```
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);
}
```
Mengolah Data Setelah menerima data, umur pengguna dihitung dengan mengurangi tahun saat ini dengan tahun:
```
final int umur = DateTime.now().year - tahun;
Menampilkan Data Data yang telah diolah ditampilkan dalam Text widget:


return Scaffold(
  body: Center(
    child: Text(
      "Halo, nama saya $nama, NIM $nim, umur saya $umur tahun.",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22),
    ),
  ),
);
```

Alur Kerja
Pengguna mengisi Nama, NIM, dan Tahun Lahir di halaman FormData.
Setelah menekan tombol "Simpan", data dari form dikirim ke halaman TampilData menggunakan Navigator.push.
Halaman TampilData menerima data tersebut melalui konstruktor, mengolahnya untuk menghitung umur, dan menampilkannya di layar.
Keunggulan Kode
Memanfaatkan TextEditingController untuk pengelolaan data input.
Modularisasi yang baik antara input (FormData) dan tampilan (TampilData).
Penggunaan Navigator mempermudah pengelolaan alur perpindahan data antar halaman.

# Screenshots

![image](https://github.com/user-attachments/assets/ad605df6-9d49-4554-aaf1-f8e1e888e252)

![image](https://github.com/user-attachments/assets/f6dd72f6-d34c-4adf-9174-8ebe6e59a435)

