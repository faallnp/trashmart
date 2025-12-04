import 'package:flutter/material.dart';

class ResiduPage extends StatelessWidget {
  const ResiduPage({super.key});

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
                        Image.asset("assets/residu.png", height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Sampah Residu",
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
⚫ Sampah Residu

Sampah residu adalah sampah yang tidak bisa didaur ulang, tidak bisa diolah, dan tidak termasuk kategori organik, anorganik, ataupun B3.

▶ Penjelasan Mendalam

Sampah ini sering berakhir di TPA dan menghasilkan masalah besar seperti bau, gas metana, dan cairan lindi yang beracun. Karena tidak ada teknologi ekonomis untuk mengolah sebagian besar residu, tujuan utama pengelolaan sampah modern adalah mengurangi produksi sampah residu sampai level terendah.

▶ Contoh Sampah Residu Lengkap

– Popok sekali pakai
– Pembalut
– Tisu bekas
– Filter rokok
– Masker medis sekali pakai
– Bahan plastik campuran
– Spons dan foam terkontaminasi
– Sisa makanan bercampur plastik
– Styrofoam kotor

▶ Bahaya Sampah Residu

– Sulit terurai (puluhan–ratusan tahun)
– Mencemari tanah
– Menghasilkan bau kuat
– Mengundang hama dan penyakit

▶ Cara Pengelolaan

– Mengurangi produk sekali pakai
– Menggunakan produk ramah lingkungan
– Menyimpan residu dalam kantong tertutup
– Tidak mencampur residu dengan sampah yang masih bisa didaur ulang
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
