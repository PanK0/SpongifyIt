import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class TextBoxForm extends StatefulWidget {
  String box_text;
  var output_text = 'oUtPuT tExT';

  TextBoxForm({Key? key, required this.box_text}) : super(key: key);

  @override
  State<TextBoxForm> createState() => _TextBoxFormState();
}

class _TextBoxFormState extends State<TextBoxForm> {
  String input = "";
  String output = "";
  int r = 0;
  bool isSwitched = false;

  var inputTextController = new TextEditingController();
  var outputTextController = new TextEditingController();

  // RANDOM TRANSFORM TEXT
  void _transformText() {
    String newtext = "";
    for (var i = 0; i < input.length; i++) {
      var rand = Random().nextInt(100);
      if (rand < 50) {
        newtext += input[i].toLowerCase();
      } else {
        newtext += input[i].toUpperCase();
      }
    }
    output = newtext;
  }

  // REGULAR TRANSFORM TEXT
  void _regularTransform() {
    String newtext = "";
    r++;
    for (var i = 0; i < input.length; i++) {
      if ((i + r) % 2 == 0) {
        newtext += input[i].toLowerCase();
      } else {
        newtext += input[i].toUpperCase();
      }
    }
    r = r % 2;
    output = newtext;
  }

  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromARGB(255, 146, 37, 3);
    String label;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ************* INPUT TEXTBOX
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: inputTextController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintText: widget.box_text,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ************* TRANSFORM BUTTON

            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    input = inputTextController.text;
                    if (isSwitched) {
                      _transformText();
                    } else {
                      _regularTransform();
                    }

                    outputTextController.text = output;
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8),
                    backgroundColor: MaterialStateProperty.all(color),
                  ),
                  child: const Text('tRAnSfoRm'),
                ),
              ],
            ),

            // ************* SWITCH BUTTON
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });

                var snackBar;
                if (isSwitched) {
                  const snackBar = SnackBar(
                    content: Text('Chaos Mode'),
                    duration: Duration(milliseconds: 500),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              activeColor: color,
            ),
            // ************* RESET BUTTON
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    inputTextController.text = "";
                    outputTextController.text = widget.output_text;
                    output = "";
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8),
                    backgroundColor: MaterialStateProperty.all(color),
                  ),
                  child: const Text('  RESET  '),
                ),
              ],
            )
          ],
        ),

        // ************* OUTPUT TEXTBOX
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: outputTextController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintText: widget.output_text,
            ),
          ),
        ),

        // ************* COPY BUTTON
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: output));
                var snackBar = SnackBar(
                  content: Text('Copied text: ' + output),
                  duration: Duration(milliseconds: 500),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(8),
                backgroundColor: MaterialStateProperty.all(color),
              ),
              child: const Text('  COPY  '),
            ),
          ],
        ),
      ],
    );
  }
}
