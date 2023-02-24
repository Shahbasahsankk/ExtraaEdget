import 'package:flutter/material.dart';

Widget skelton(double height, double width) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.04),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
