import 'package:flutter/material.dart';
import 'package:trashsmart/pages/data_profile.dart';

class ProfilePage extends StatelessWidget {
  final ValueChanged<int>? onChangeTab;
  const ProfilePage({super.key, this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3E8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER + FOTO
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD1E2C4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),

                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logo_tanpanama.png", width: 50),
                        const SizedBox(width: 6),
                        const Text(
                          "TRASHSMART",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // TOMBOL BACK
                Positioned(
                  left: 20,
                  top: 40,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                ),

                // FOTO PROFIL
                Positioned(
                  bottom: -55,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage("assets/profile.png"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // ================= INFORMASI =================
            const Text(
              "Smartizen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFD1E2C4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("TrashSmarter@gmail.com"),
            ),

            const SizedBox(height: 6),
            const Text("+62-812-7133-9807"),

            const SizedBox(height: 24),

            // ================= BOX MENU =================
            Container(
              width: 320,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  menuItem(Icons.edit, "Edit Profile", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DataProfilePage()),
                    );
                  }),
                  menuItem(Icons.bookmark, "Save Artikel", () {}),
                  menuItem(Icons.logout, "Logout", () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ================= FUNCTION MENU ITEM =================
  Widget menuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 22, color: Colors.black87),
                const SizedBox(width: 12),
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
