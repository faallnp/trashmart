import 'package:flutter/material.dart';

class OrganikPage extends StatelessWidget {
  const OrganikPage({super.key});

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
                        Image.asset("assets/organik.png", height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Sampah Organik",
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
🟢 Sampah Organik

Sampah organik adalah semua jenis sampah yang berasal dari makhluk hidup seperti tumbuhan, hewan, dan manusia yang dapat mengalami proses penguraian alami. Proses ini terjadi karena adanya aktivitas mikroorganisme yang memecah senyawa-senyawa kompleks menjadi elemen dasar seperti nutrisi tanah. Sampah organik biasanya cepat membusuk sehingga memiliki potensi bau yang kuat jika tidak dikelola dengan benar.

▶ Penjelasan Mendalam

Secara ilmiah, proses penguraian sampah organik disebut biodegradasi, yaitu perubahan struktur kimia bahan organik menjadi bentuk yang lebih sederhana. Mikroorganisme yang berperan antara lain bakteri, jamur, protozoa, dan cacing tanah. Mereka membutuhkan kondisi tertentu seperti kelembapan, suhu yang stabil, dan oksigen yang cukup agar proses dekomposisi berjalan optimal.

Sampah organik juga merupakan penyumbang gas rumah kaca, terutama metana (CH4), jika menumpuk di tempat pembuangan akhir (TPA) tanpa suplai oksigen. Gas metana jauh lebih berbahaya dibandingkan CO2 dalam mempengaruhi pemanasan global. Inilah alasan mengapa sampah organik harus dipisahkan sejak awal dan diolah dengan benar.

▶ Contoh Sampah Organik yang Lebih Lengkap

– Semua jenis sisa makanan
– Kulit buah, kulit sayuran
– Sisa daging dan ikan
– Sisa nasi, sambal, dan lauk pauk
– Biji buah dan batang sayur
– Daun kering, ranting pohon
– Sisa potongan tanaman hias
– Kulit telur dan cangkang kerang
– Kotoran hewan peliharaan
– Ampas kopi, teh, dan rempah dapur
– Bunga layu, rumput potongan

▶ Bahaya Sampah Organik Jika Tidak Dikelola

– Menghasilkan cairan hitam (lindi) yang mencemari tanah dan air
– Mengundang lalat, tikus, dan penyakit
– Menimbulkan bau kuat dan tidak sedap
– Menghasilkan metana yang memicu ledakan di TPA
– Menyumbang penumpukan sampah ±50% dari total sampah kota

▶ Manfaat Jika Dikelola dengan Benar

– Menjadi kompos berkualitas tinggi
– Mengembalikan nutrisi pada tanah
– Mengurangi volume sampah secara drastis
– Mengurangi ketergantungan pada pupuk kimia
– Mencegah pencemaran lingkungan

▶ Proses Pengolahan Modern 

– Komposter Takakura: cara cepat dan higienis membuat kompos di rumah.
– Ludwig Home Composter: komposter berputar untuk hasil kompos cepat.
– Biopori: lubang resapan yang mempercepat penguraian organik di tanah.
– Anaerobic Digester: mengubah sampah organik menjadi biogas.
– Eco-Enzyme: sisa buah difermentasi menjadi cairan pembersih alami.
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
