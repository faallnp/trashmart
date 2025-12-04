import 'package:flutter/material.dart';

class AnorganikPage extends StatelessWidget {
  const AnorganikPage({super.key});

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
                        Image.asset("assets/anorganik.png", height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Sampah Anorganik",
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
🟡 Sampah Anorganik

Sampah anorganik adalah sampah yang berasal dari bahan buatan manusia, industri, atau material mineral yang sangat sulit terurai secara alami. Waktu penguraiannya bisa mencapai ratusan bahkan ribuan tahun tergantung jenis bahan.

▶ Penjelasan Mendalam

Secara kimia, bahan anorganik memiliki struktur yang lebih kuat dan stabil, sehingga mikroorganisme tidak dapat memecahnya dengan mudah. Plastik, misalnya, memiliki ikatan polimer yang panjang dan rumit sehingga harus diproses dengan teknologi tertentu sebelum dapat didaur ulang.

Masalah utama sampah anorganik adalah penumpukan. Karena tidak mudah hancur, sampah anorganik menjadi penyebab utama pencemaran laut, penyumbatan sungai, dan terbentuknya mikroplastik.

Mikroplastik berbahaya karena:
– Masuk ke makanan laut (ikan, garam, kerang)
– Masuk ke tubuh manusia
– Mengganggu sistem hormon
– Ditemukan bahkan dalam air minum galon

▶ Contoh Sampah Anorganik yang Lebih Lengkap

– Botol plastik minuman
– Gelas plastik
– Kresek dan kantung kemasan
– Plastik multilayer (sachet kopi, snack)
– Styrofoam
– Mainan plastik
– Kaca bening dan kaca warna
– Kaleng minuman, kaleng cat
– Potongan logam, aluminium
– Pipa PVC
– CD, DVD
– Peralatan elektronik rusak ringan

▶ Bahaya Sampah Anorganik

– Menghasilkan mikroplastik yang masuk ke makanan
– Mencemari sungai dan laut
– Membahayakan hewan yang memakannya
– Menghambat infiltrasi air di tanah
– Membutuhkan energi besar untuk dihancurkan

▶ Manfaat Jika Dikelola dengan Benar

– Dapat dijual ke bank sampah
– Bisa didaur ulang menjadi produk baru
– Mengurangi beban TPA
– Mengurangi penebangan pohon (untuk kertas/karton daur ulang)

▶ Teknologi Pengolahan Anorganik Modern

– Mesin pencuci dan pencacah plastik
– Pelletizer plastik untuk membuat biji plastik baru
– Pemanas pyrolysis untuk mengubah plastik menjadi BBM
– Pengolahan logam dengan furnace
– Pengolahan kaca menjadi pasir bangunan
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
