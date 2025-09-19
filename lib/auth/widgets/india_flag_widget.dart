import 'package:flutter/material.dart';

class IndiaFlagWidget extends StatelessWidget {
  const IndiaFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFF9933), // Saffron
            Colors.white,
            Color(0xFF138808), // Green
          ],
          stops: [0.33, 0.5, 0.67],
        ),
      ),
      child: const Center(
        child: Icon(Icons.circle, size: 4, color: Color(0xFF000080)),
      ),
    );
  }
}
