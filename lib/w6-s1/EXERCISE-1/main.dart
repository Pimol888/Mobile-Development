import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var color in colors) Text(color),
            const Label("Method 2: Map", bold: true),
            ...colors.map((color) => Text(color)),
            const Label("Method 3: Dedicated Function", bold: true),
            ...getColors(),
          ],
        ),
      ),
    ),
  ));
}

List<String> colors = ["red", "blue", "green"];

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

List<Widget> getColors() {
  return colors.map((color) => Text(color)).toList();
}