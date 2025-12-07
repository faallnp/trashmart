import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final ValueChanged<int>? onChangeTab;
  const ProfilePage({super.key, this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // kembali ke Home tab jika tekan back di profile
                  if (onChangeTab != null) onChangeTab!(0);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 6),
              const Text("Profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 18),
          Center(
            child: Column(
              children: const [
                CircleAvatar(radius: 44, backgroundImage: AssetImage('assets/avatar.png')),
                SizedBox(height: 12),
                Text("Akuikan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                Text("Ikan Bakso ahah", style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Edit Profile"),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Pengaturan"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
