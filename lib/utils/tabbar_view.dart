// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/model/music.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MusicCards extends StatefulWidget {
  const MusicCards({super.key});

  @override
  State<MusicCards> createState() => _MusicCardsState();
}

class _MusicCardsState extends State<MusicCards> {
  final List<Song> _songslist = [
    Song('assets/song.png', 'King', 4.25),
    Song('assets/song.png', 'King', 4.25),
    Song('assets/song.png', 'King', 4.25),
  ];

  Widget _buildMusicCard(BuildContext context, int index) {
    Song song = _songslist[index];
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(213, 157, 153, 135),
                blurRadius: 10,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Image.asset(
            song.imagePath,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollSnapList(
      focusOnItemTap: true,
      itemBuilder: _buildMusicCard,
      itemCount: _songslist.length,
      itemSize: 200,
      onItemFocus: (p0) {},
      dynamicItemSize: true,
    );
  }
}
