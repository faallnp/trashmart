import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Kenali Sampah, Mulai\ndari Dirimu',
      'desc':
          'Semua dimulai dari pengetahuan kecil yang membawa perubahan besar',
      'image': 'assets/onboard1.png',
    },
    {
      'title': 'Belajar Seru\nTentang Sampah',
      'desc': 'Temukan materi, artikel, dan tips menarik tentang sampah',
      'image': 'assets/onboard2.png',
    },
    {
      'title': 'Mulai Kebiasaan\nBaik Hari Ini!',
      'desc':
          'Dapatkan pengingat dan inspirasi harian untuk hidup lebih ramah lingkungan',
      'image': 'assets/onboard3.png',
    },
  ];

  void next() {
    if (currentIndex < 2) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  void back() {
    if (currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0DD),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentIndex = index),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          pages[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3C5122),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          pages[index]['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3C5122),
                          ),
                        ),
                        const SizedBox(height: 30),

                        /// IMAGE
                        Expanded(
                          child: Image.asset(
                            pages[index]['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// DOT INDICATOR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (i) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: currentIndex == i ? 16 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: currentIndex == i
                                    ? const Color(0xFF3C5122)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 25),

                        /// BUTTONS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// BACK
                            if (currentIndex != 0)
                              ElevatedButton(
                                onPressed: back,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3C5122),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  minimumSize: const Size(80, 40),
                                ),
                                child: const Text("Back"),
                              )
                            else
                              const SizedBox(width: 80),

                            /// NEXT
                            ElevatedButton(
                              onPressed: next,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3C5122),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                minimumSize: const Size(80, 40),
                              ),
                              child: Text(currentIndex == 2 ? "Finish" : "Next"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
