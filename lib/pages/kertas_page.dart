import 'package:flutter/material.dart';

class KertasPage extends StatelessWidget {
  const KertasPage({super.key});

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
                        Image.asset("assets/kertas.png", height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Sampah Kertas",
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
📘 Sampah Kertas

Kertas adalah salah satu bahan paling mudah didaur ulang, namun tetap menjadi salah satu sampah yang banyak ditemukan setiap hari.

▶ Penjelasan Mendalam

Kertas terbuat dari serat pohon (selulosa). Masalahnya, kebutuhan kertas yang tinggi membuat banyak pohon harus ditebang. Daur ulang kertas sangat penting karena dapat:

– Mengurangi penebangan pohon
– Menghemat air dan energi
– Menguranngi gas rumah kaca
– Mengurangi volume TPA

Jika 1 ton kertas didaur ulang, dapat menghemat:
– 17 pohon
– 26.000 liter air
– 4000 kWh energi
– 2,5 meter kubik ruang TPA

▶ Contoh Sampah Kertas Lengkap

– Kertas HVS
– Kertas buku tulis
– Koran & majalah
– Kertas fotokopi
– Kardus & karton
– Paperbag
– Kertas dokumen
– Box makanan kertas (selama tidak berminyak)

▶ Kendala Pengolahan Kertas

– Tidak boleh basah
– Tidak boleh berminyak
– Rusak jika bercampur plastik
– Harus dipilah berdasarkan jenis serat

▶ Cara Pengelolaan Modern

– Mengumpulkan kertas kering
– Menghindari mencampur dengan sampah dapur
– Menekan kertas agar mudah disimpan
– Mengantar kertas ke bank sampah
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
