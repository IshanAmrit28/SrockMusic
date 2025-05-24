import 'package:flutter/material.dart';

import '../../widgets/header.dart';


class LyricsPage extends StatefulWidget {
  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Header(),
          const Expanded(
            child: Center(
              child: Text(
                'Welcome to the Lyrics Writing page',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
