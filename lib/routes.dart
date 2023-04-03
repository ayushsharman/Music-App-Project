import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_app/pages/emotion_detect.dart';
import 'package:music_app/pages/homepage.dart';
import 'package:music_app/pages/profile.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int _selectedIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const EmotionDetection(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white30,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.play),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
