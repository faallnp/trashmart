import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EC),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF3E472D),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.menu_book, color: Colors.white),
            Icon(Icons.list_alt, color: Colors.white),
            Icon(Icons.account_circle, color: Colors.white),

          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // HEADER
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Halo, Smartizen!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Yuk, eksplor dan belajar bersama",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/avatar.png"),
                )
              ],
            ),

            const SizedBox(height: 20),

            // PENGINGAT
            const Text("Pengingat untukmu",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF3F4F44),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "AYO BUANG SAMPAH SEKARANG JUGA!",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // TRASH LEARNING
            const Text("TrashLearning",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  learningCard(
                    "Sampah Organik",
                    "assets/organik.png",
                        () {
                    },
                  ),
                  learningCard(
                    "Sampah Anorganik",
                    "assets/anorganik.png",
                        () {
                        },
                  ),
                  learningCard(
                    "Sampah B3",
                    "assets/b3.png",
                        () {},
                  ),
                  learningCard(
                    "Sampah Kertas",
                    "assets/kertas.png",
                        () {},
                  ),
                  learningCard(
                    "Sampah Residu",
                    "assets/residu.png",
                        () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TRASH NEWS
            const Text("TrashNews",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildNewsCard(
                    "Pertemuan bilateral Indonesia - Norwegia bahas solusi sampah plastik",
                    "assets/artikel_1.png",
                  ),
                  _buildNewsCard(
                    "Kelola Sampah Tingkat Lokal, Bank Sampah RW 01 Depok Beroperasi",
                    "assets/artikel_2.png",
                  ),
                  _buildNewsCard(
                    "Kelola Sampah Tingkat Lokal, Bank Sampah RW 01 Depok Beroperasi",
                    "assets/artikel_3.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CARD TRASH LEARNING
  Widget learningCard(String title, String imgPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgPath, width: 100),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize:13)),
          ],
        ),
      ),
    );
  }


  // CARD NEWS
  Widget _buildNewsCard(String title, String img, ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(img, height: 100, width: 180, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(title, style: const TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
