import 'package:flutter/material.dart';
import 'package:spongifyit/pages/home_page.dart';

void main() {
  runApp(const SpongifyIt());
}

class SpongifyIt extends StatelessWidget {
  const SpongifyIt({Key? key}) : super(key: key);

  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    // in the MaterialApp() must be added the widgets created in the build() in order to show them in the GUI
    return MaterialApp(
      title: 'SpongifyIt',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const Spongee(),
    ); // MaterialApp
  } // build

} // class InPlace
