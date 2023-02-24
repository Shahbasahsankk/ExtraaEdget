import 'package:flutter/material.dart';

Widget preferesSizeAppbar() {
  return Container(
    height: 70,
    width: double.infinity,
    color: Colors.black,
    child: const Center(
      child: Image(
        width: 200,
        height: 500,
        image: AssetImage('assets/spaceX.jpg'),
      ),
    ),
  );
}
