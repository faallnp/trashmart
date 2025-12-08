import 'package:flutter/material.dart';

class DataProfilePage extends StatelessWidget {
  const DataProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EC),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png", width: 50),
                      const SizedBox(width: 8),
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

                // BACK BUTTON
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

                // PROFILE PHOTO + EDIT ICON
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 200,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/profile.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            //FORM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  textField("username"),

                  const SizedBox(height: 20),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  textField("email"),

                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  textField("password", isPassword: true),

                  const SizedBox(height: 30),

                  // UPDATE BUTTON
                  Center(
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFF445A40),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Konfrimasi",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= REUSABLE TEXTFIELD =================
  Widget textField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black87, width: 1.5),
        ),
      ),
    );
  }
}
