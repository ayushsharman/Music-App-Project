// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_app/model/music.dart';

class SongListView extends StatefulWidget {
  const SongListView({super.key});

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> {
  final List<Song> _songslist = [
    Song('assets/song 2.png', 'King', 4.25),
    Song('assets/song 2.png', 'King', 4.25),
    Song('assets/song 2.png', 'King', 4.25),
  ];

  Widget _buildMusicCard(BuildContext context, int index) {
    Song song = _songslist[index];
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _buildMusicCard(context, index),
      itemCount: _songslist.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
