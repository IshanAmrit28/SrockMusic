import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
                    'Your News will appear here',
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
