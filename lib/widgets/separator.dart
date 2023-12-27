import 'package:flutter/material.dart';

class SeparatorVertical extends StatelessWidget {
  const SeparatorVertical({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class SeparatorHorizontal extends StatelessWidget {
  const SeparatorHorizontal({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}