import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF18171C),
      child: SafeArea(
        top: false,
        bottom: false,
        child: child,
      ),
    );
  }
}
