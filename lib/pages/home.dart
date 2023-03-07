// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_app/utils/listview.dart';
import 'package:music_app/utils/tabbar_view.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dynamic _username = "Ayush";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$_username  🐥",
                style: GoogleFonts.lexend(fontSize: 22),
              ),
            ],
          ),
          actions: [
            Icon(
              Iconsax.search_normal,
            ),
            SizedBox(width: 20),
            Icon(Iconsax.profile_circle),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              unselectedLabelStyle: GoogleFonts.lexend(fontSize: 16),
              labelStyle: GoogleFonts.lexend(
                shadows: [
                  Shadow(
                      color: Colors.white,
                      offset: Offset(0, 5),
                      blurRadius: 60),
                ],
                fontSize: 24,
              ),
              tabs: [
                Text("Hindi"),
                Text("English"),
                Text("Punjabi"),
              ],
              indicator: MaterialIndicator(
                horizontalPadding: 20,
                color: Colors.transparent,
                paintingStyle: PaintingStyle.fill,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 250,
              child: TabBarView(
                children: [
                  MusicCards(),
                  MusicCards(),
                  MusicCards(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "New to you",
                style: GoogleFonts.lexend(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SongListView(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white30,
          selectedItemColor: Colors.white,
          items: [
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
      ),
    );
  }
}
