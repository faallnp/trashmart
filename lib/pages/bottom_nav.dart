import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 28),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF3E472D),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.home, 0),
          _navIcon(Icons.menu_book_rounded, 1),
          _navIcon(Icons.newspaper_rounded, 2),
          _navIcon(Icons.account_circle_outlined, 3),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    final bool active = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        padding: EdgeInsets.symmetric(horizontal: active ? 14 : 6, vertical: 6),
        decoration: active
            ? BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(14),
              )
            : null,
        child: Icon(
          icon,
          size: active ? 28 : 24,
          color: active ? Colors.yellow : Colors.white,
        ),
      ),
    );
  }
}
