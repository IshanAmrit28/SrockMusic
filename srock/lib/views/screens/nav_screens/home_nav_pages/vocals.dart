import 'package:flutter/material.dart';
import 'package:srock/views/screens/widgets/background.dart';

import '../../widgets/header.dart';


class VocalsPage extends StatefulWidget {
  @override
  State<VocalsPage> createState() => _VocalsPageState();
}

class _VocalsPageState extends State<VocalsPage> {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Header(),
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to the Vocals page',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
