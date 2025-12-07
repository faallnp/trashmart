import 'package:flutter/material.dart';

class B3Page extends StatelessWidget {
  const B3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Background card
              Container(
                height: 340,
                decoration: const BoxDecoration(
                  color: Color(0xFF3E472D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),

              // Tombol back
              Positioned(
                top: 45,
                left: 15,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),

              // Ornamen daun kanan atas
              Positioned(
                top: 40,
                right: 25,
                child: Image.asset(
                  "assets/ornamen_1.png",
                  width: 55,
                  fit: BoxFit.contain,
                ),
              ),

              // Ornamen daun kiri bawah
              Positioned(
                bottom: 20,
                left: 20,
                child: Image.asset(
                  "assets/ornamen_2.png",
                  width: 65,
                  fit: BoxFit.contain,
                ),
              ),

              // Gambar Tempat Sampah
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/b3.png",
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Sampah B3",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3E472D),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Bagian MATERI MATERI
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Materi-materi ABCD",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3E472D),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
