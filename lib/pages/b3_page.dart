  import 'package:flutter/material.dart';

class B3Page extends StatelessWidget {
  const B3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF3F4F44),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.asset("assets/b3.png", height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Sampah B3",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: const SingleChildScrollView(
                  child: Text(
                    """
🟠 Sampah B3 (Bahan Berbahaya dan Beracun)

Sampah B3 adalah sampah yang mengandung zat kimia berbahaya, bersifat korosif, mudah terbakar, beracun, atau reaktif sehingga membutuhkan penanganan khusus.

▶ Penjelasan Mendalam

Sampah B3 memiliki karakteristik seperti:
– Korosif: dapat merusak logam atau kulit
– Toksik: berpotensi menyebabkan keracunan
– Reaktif: dapat meledak jika terkena udara atau air
– Flammable: mudah terbakar
– Infeksius: membawa bakteri atau virus

B3 adalah kategori paling berbahaya karena bisa menyebabkan kerusakan permanen pada kesehatan manusia. Banyak negara membuat aturan ketat bahkan larangan membuang sampah B3 sembarangan.

▶ Contoh Sampah B3 Lengkap

– Oli kendaraan bekas
– Aki motor & mobil
– Baterai AA, AAA, baterai hape
– Lampu neon & lampu LED
– Cat, thinner, lem kimia
– Obat kedaluwarsa
– Jarum suntik
– Limbah pembersih lantai
– Parfum & cairan kimia rumah tangga
– Komponen elektronik (chip, motherboard, charger)

▶ Bahaya Sampah B3

– Merusak organ pernapasan jika terhirup
– Menyebabkan kanker jika kontak jangka panjang
– Mencemari air dan tanah dengan logam berat
– Menyebabkan mutasi pada makhluk hidup
– Menghasilkan racun yang sulit hilang puluhan tahun

▶ Cara Pengelolaan Aman

– Tidak dibuang ke tong sampah biasa
– Disimpan dalam wadah tertutup
– Diantar ke tempat layanan limbah B3
– Tidak dibakar
– Tidak direndam atau dicampur dengan sampah lain
                    """,
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
