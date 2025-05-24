import 'package:flutter/material.dart';

import '../../widgets/header.dart';


class MixingPage extends StatefulWidget {
  @override
  State<MixingPage> createState() => _MixingPageState();
}

class _MixingPageState extends State<MixingPage> {
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
                'Welcome to the Mixing & Mastering page',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
