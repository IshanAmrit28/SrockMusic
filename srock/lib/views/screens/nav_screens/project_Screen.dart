import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/header.dart';


class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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
                    'Your projects will appear here',
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

