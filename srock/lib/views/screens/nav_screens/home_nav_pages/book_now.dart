import 'package:flutter/material.dart';

import '../../widgets/background.dart';
import '../../widgets/header.dart';



class BookNow extends StatefulWidget {
  const BookNow({super.key});

  @override
  State<BookNow> createState() => _BookNow();
}

class _BookNow extends State<BookNow> {
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
                    'Book your Seat Now!!',
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
