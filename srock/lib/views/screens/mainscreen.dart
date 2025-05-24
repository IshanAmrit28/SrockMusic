import 'package:flutter/material.dart';

import 'nav_screens/homescreen.dart';
import 'nav_screens/news_screen.dart';
import 'nav_screens/project_Screen.dart';
import 'nav_screens/trackbox_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const News(),
    const Trackbox(),
    const Projects(),
  ];

  final List<String> _labels = ["Home", "News", "TrackBox", "Projects"];
  final List<String> _icons = [
    "assets/icons/home.png",
    "assets/icons/news.png",
    "assets/icons/track.png",
    "assets/icons/projects.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18171C),
      body: _pages[_pageIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF18171C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          border: Border(
            top: BorderSide(color: Color(0xFF2C2D31), width: 1)
          ),
        ),
        padding: const EdgeInsets.only(top: 13, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            return _buildNavItem(_icons[index], _labels[index], index);
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final bool isSelected = _pageIndex == index;
    final Color itemColor = isSelected ? Colors.white : Colors.grey;

    return SizedBox(
      width: 70,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (isSelected)
            Positioned(
              top: -20, // Tight to the top border
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                _pageIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6), // Adjust for circle overlap
                Image.asset(
                  iconPath,
                  width: 22,
                  color: itemColor,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
