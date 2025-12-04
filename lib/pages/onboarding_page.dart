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
                  // AnimatedBuilder dengan perhitungan responsif & easing
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final double screenW = MediaQuery.of(context).size.width;
                      double page = index.toDouble();
                      if (_controller.hasClients && _controller.page != null) {
                        page = _controller.page!;
                      }
                      final double delta = page - index;
                      final double rawOffset = delta.abs().clamp(0.0, 1.0);
                      final double eased = Curves.easeOut.transform(rawOffset);

                      // responsif berdasarkan lebar layar
                      final double translateX = delta * screenW * 0.06; // seluruh page slide
                      final double pageScale = 1 - (eased * 0.06);

                      // image lebih "hidup" saat bergeser
                      final double imageTranslateX = delta * screenW * 0.12;
                      final double imageScale = 1 - (eased * 0.12);

                      // teks lebih subtle dan pake eased opacity
                      final double textOpacity = (1 - eased * 0.7).clamp(0.0, 1.0);
                      final double titleTranslateX = delta * screenW * 0.03;
                      final double descTranslateX = delta * screenW * 0.02;

                      return Transform.translate(
                        offset: Offset(translateX, 0),
                        child: Transform.scale(
                          scale: pageScale,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),

                                // TITLE with slight fade/translate
                                Opacity(
                                  opacity: textOpacity,
                                  child: Transform.translate(
                                    offset: Offset(titleTranslateX, 0),
                                    child: Text(
                                      pages[index]['title']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3C5122),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                Opacity(
                                  opacity: textOpacity,
                                  child: Transform.translate(
                                    offset: Offset(descTranslateX, 0),
                                    child: Text(
                                      pages[index]['desc']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF3C5122),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                /// IMAGE (animated separately)
                                Expanded(
                                  child: Transform.translate(
                                    offset: Offset(imageTranslateX, 0),
                                    child: Transform.scale(
                                      scale: imageScale,
                                      child: Image.asset(
                                        pages[index]['image']!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// DOT INDICATOR (dinamis dari jumlah pages)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(pages.length, (i) {
                                    final bool active = currentIndex == i;
                                    return AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                      margin: const EdgeInsets.symmetric(horizontal: 6),
                                      width: active ? 18 : 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: active ? const Color(0xFF3C5122) : Colors.grey.shade400,
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
                                              borderRadius: BorderRadius.circular(20)),
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
                                            borderRadius: BorderRadius.circular(20)),
                                        minimumSize: const Size(80, 40),
                                      ),
                                      child: Text(currentIndex == pages.length - 1 ? "Finish" : "Next"),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
