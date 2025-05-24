import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';

class Trackbox extends StatefulWidget {
  const Trackbox({super.key});

  @override
  State<Trackbox> createState() => _TrackboxState();
}

class _TrackboxState extends State<Trackbox> {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Header(),
            const Expanded(
              child: Center(
                child: Text(
                  'your tracks will appear here',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
