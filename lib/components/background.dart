import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget content;
  const AppBackground({Key? key, required this.content }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.01, 0.08, 0.18, 0.25, 0.3, 1],
          colors: [Color(0xFF0f4e71), Color(0xFF103751), Color(0xFF0e202e), Color(0xFF0f1b27), Color(0xFF0e171e), Color(0xFF0E171E)]
        ),
      ),
      child: content,
    );
  }
}
