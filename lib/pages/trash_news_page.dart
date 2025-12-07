import 'package:flutter/material.dart';

class TrashNewsPage extends StatelessWidget {
  final ValueChanged<int>? onChangeTab;
  const TrashNewsPage({super.key, this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (onChangeTab != null) onChangeTab!(0);
                  else Navigator.pop(context);
                },
              ),
              const SizedBox(width: 6),
              const Text("TrashNews", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          const Text("Update info terbaru seputar lingkungan!", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),

          _newsItem(
            "Pertemuan bilateral Indonesia - Norwegia bahas solusi sampah plastik",
            "assets/artikel_1.png",
          ),
          _newsItem(
            "Kelola Sampah Tingkat Lokal, Bank Sampah RW 01 Depok Resmi Beroperasi",
            "assets/artikel_2.png",
          ),
          _newsItem(
            "Pengelolaan Sampah Meningkat di 2025",
            "assets/artikel_3.png",
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _newsItem(String title, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: imageUrl.trim().toLowerCase().startsWith('http')
                ? Image.network(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover)
                : Image.asset(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
