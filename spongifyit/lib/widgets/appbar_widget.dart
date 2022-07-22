import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: const Text('SpongifyIt'),
    backgroundColor: Color.fromARGB(255, 146, 37, 3),
    elevation: 0,
  );
}
