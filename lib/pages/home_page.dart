import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'trash_learning_page.dart';
import 'trash_news_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // pages: index 0 = HomeMainContent, 1 = TrashLearning, 2 = TrashNews, 3 = Profile
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeMainContent(onChangeTab: changeTab),
      TrashLearningPage(onChangeTab: changeTab),
      TrashNewsPage(onChangeTab: changeTab),
      ProfilePage(onChangeTab: changeTab),
    ];
  }

  void changeTab(int idx) {
    setState(() => selectedIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedSwitcher + slide+fade effect for smooth transitions
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EC),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) {
            // combine slide from right/left depending on index change and fade
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.05),
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnimation, child: child),
            );
          },
          child: SizedBox(
            // key so AnimatedSwitcher recognizes different children
            key: ValueKey<int>(selectedIndex),
            child: IndexedStack(index: selectedIndex, children: pages),
          ),
        ),
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        onTap: (i) => changeTab(i),
      ),
    );
  }
}


class HomeMainContent extends StatelessWidget {
  final ValueChanged<int>? onChangeTab;
  const HomeMainContent({super.key, this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // HEADER
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Halo, Smartizen!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Yuk, eksplor dan belajar bersama", style: TextStyle(fontSize: 12)),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (onChangeTab != null) onChangeTab!(3); // buka profile tab
              },
              child: const CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatar.png')),
            )
          ],
        ),
        const SizedBox(height: 20),

       
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _quickSquare(Icons.info_outline, "Info"),
            _quickSquare(Icons.star_border, "Tips"),
            _quickSquare(Icons.water_drop_outlined, "Air"),
            _quickSquare(Icons.recycling_outlined, "Sampah"),
          ],
        ),

        const SizedBox(height: 18),

        const Text("Pengingat untukmu", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: const Color(0xFF3F4F44), borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              Expanded(child: Text("Sudah buang sampah hari ini?", style: TextStyle(color: Colors.white))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF3F4F44)),
                onPressed: () {},
                child: const Text("Cek sekarang"),
              )
            ],
          ),
        ),

        const SizedBox(height: 22),

        const Text("TrashLearning", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _learningCard(context, "Sampah Organik", "assets/organik.png"),
              _learningCard(context, "Sampah Anorganik", "assets/anorganik.png"),
              _learningCard(context, "Sampah B3", "assets/b3.png"),
              _learningCard(context, "Sampah Kertas", "assets/kertas.png"),
              _learningCard(context, "Sampah Residu", "assets/residu.png"),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text("TrashNews", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _newsCard("Pertemuan bilateral Indonesia - Norwegia bahas solusi sampah plastik", "assets/artikel_1.png"),
              _newsCard("Kelola Sampah Tingkat Lokal, Bank Sampah RW 01 Depok Beroperasi", "assets/artikel_2.png"),
              _newsCard("Pengelolaan Sampah Meningkat di 2025", "assets/artikel_3.png"),
            ],
          ),
        ),

        const SizedBox(height: 60),
      ],
    );
  }

  Widget _quickSquare(IconData icon, String label) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.04), blurRadius: 6)]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.black54), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 11))]),
    );
  }

  Widget _learningCard(BuildContext context, String title, String asset) {
    return GestureDetector(
      onTap: () {
        // pindah ke learning tab
        final homeState = context.findAncestorStateOfType<_HomePageState>();
        homeState?.setState(() => homeState.selectedIndex = 1);
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(asset, width: 80, height: 80, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        ]),
      ),
    );
  }

  Widget _newsCard(String title, String imageUrl) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.04), blurRadius: 8)]),
      child: Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          child: imageUrl.startsWith('http')
              ? Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover)
              : Image.asset(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(padding: const EdgeInsets.all(8), child: Text(title, style: const TextStyle(fontSize: 13))),
      ]),
    );
  }
}
