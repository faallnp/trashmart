import 'package:flutter/material.dart';
// import halaman kategori yang sudah ada (sesuaikan path & class name jika beda)
import 'package:trashsmart/pages/organik_page.dart';
import 'package:trashsmart/pages/anorganik_page.dart';
import 'package:trashsmart/pages/b3_page.dart';
import 'package:trashsmart/pages/kertas_page.dart';
import 'package:trashsmart/pages/residu_page.dart';

class TrashLearningPage extends StatelessWidget {
  final ValueChanged<int>? onChangeTab;
  const TrashLearningPage({super.key, this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    // desain mengikuti screenshot: header + 3 info card + "Mulai Belajar Sekarang" dengan ikon tong sampah
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (onChangeTab != null) onChangeTab!(0); // kembali ke Home tab
                  else Navigator.pop(context);
                },
              ),
              const SizedBox(width: 6),
              const Text("TrashLearning",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),

          // 3 info card
          Column(
            children: [
              _infoCard(
                color: const Color(0xFFF7D9A5),
                text:
                    "Menjelaskan berbagai jenis sampah seperti organik, anorganik, hingga berbahaya.",
                assetIcon: null,
              ),
              const SizedBox(height: 10),
              _infoCard(
                color: const Color(0xFFEEC1C8),
                text:
                    "Panduan singkat cara pengelolaan sampah agar menjaga lingkungan.",
                assetIcon: null,
              ),
              const SizedBox(height: 10),
              _infoCard(
                color: const Color(0xFFCFE5C2),
                text: "Tips sederhana untuk memahami kategori sampah dan memilahnya.",
                assetIcon: null,
              ),
            ],
          ),

          const SizedBox(height: 22),
          const Text("Mulai Belajar Sekarang",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),

          // GRID jenis sampah (tampil juga di Homepage)
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _categoryItem(context, "Organik", Colors.green, "assets/organik.png"),
              _categoryItem(context, "Anorganik", Colors.orange, "assets/anorganik.png"),
              _categoryItem(context, "Sampah B3", Colors.red, "assets/b3.png"),
              _categoryItem(context, "Kertas", Colors.blue, "assets/kertas.png"),
              _categoryItem(context, "Residu", Colors.grey, "assets/residu.png"),
            ],
          ),
          const SizedBox(height: 60), // space above bottom nav
        ],
      ),
    );
  }

  Widget _infoCard({required Color color, required String text, String? assetIcon}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13, height: 1.3))),
          if (assetIcon != null) ...[
            const SizedBox(width: 10),
            Image.asset(assetIcon, height: 54),
          ]
        ],
      ),
    );
  }

  Widget _categoryItem(BuildContext context, String title, Color color, String asset) {
    return GestureDetector(
      onTap: () {
        // buka page spesifik berdasarkan nama kategori
        _openCategory(context, title, color, asset);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 6)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pakai asset jika ada, kalau tidak ada pakai CircleAvatar ikon
            Flexible(
              child: assetExists(asset)
                  ? Image.asset(asset, height: 48)
                  : CircleAvatar(radius: 20, backgroundColor: color.withOpacity(0.2), child: Icon(Icons.delete, color: color)),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  void _openCategory(BuildContext context, String title, Color color, String asset) {
    final key = title.toLowerCase().trim();
    Widget page;
    switch (key) {
      case 'organik':
        page = const OrganikPage();
        break;
      case 'anorganik':
        page = const AnorganikPage();
        break;
      case 'sampah b3':
      case 'b3':
        page = const B3Page();
        break;
      case 'kertas':
        page = const KertasPage();
        break;
      case 'residu':
        page = const ResiduPage();
        break;
      default:
        // fallback ke detail umum jika page spesifik belum tersedia
        page = TrashDetailPage(title: title, color: color, asset: asset);
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

// simple check placeholder (kamu bisa ganti jadi sebenarnya cek asset)
bool assetExists(String path) {
  // avoid runtime checks here — assume assets are provided; return true
  return true;
}

// Tambahkan halaman detail sederhana di file yang sama
class TrashDetailPage extends StatelessWidget {
  final String title;
  final Color color;
  final String asset;
  const TrashDetailPage({super.key, required this.title, required this.color, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
             
            ],
          ),
        ),
      ),
    );
  }
}
