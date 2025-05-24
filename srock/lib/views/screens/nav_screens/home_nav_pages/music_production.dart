import 'package:flutter/material.dart';

import '../../widgets/header.dart';


class MusicProductionPage extends StatefulWidget {
  @override
  State<MusicProductionPage> createState() => _MusicProductionPageState();
}

class _MusicProductionPageState extends State<MusicProductionPage> {
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
                'Welcome to the Music Production page',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
