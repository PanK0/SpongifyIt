import 'package:flutter/material.dart';
import 'package:spongifyit/widgets/appbar_widget.dart';
import 'package:spongifyit/widgets/textbox_widget.dart';

class Spongee extends StatefulWidget {
  const Spongee({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SpongeeState();
}

class _SpongeeState extends State<Spongee> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.yellow,
      body: ListView(
        children: [
          TextBoxForm(
            box_text: 'Input Text',
          ),
        ],
      ),
    );
  }
}
