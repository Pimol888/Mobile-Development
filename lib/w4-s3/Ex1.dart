import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: _toggleSelection,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
          ),
          child: Center(
            child: Text(
              isSelected ? 'Selected' : 'Not Selected',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Selectable Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(),
              const SizedBox(height: 16),
              SelectableButton(),
              const SizedBox(height: 16),
              SelectableButton(),
              const SizedBox(height: 16),
              SelectableButton(),
            ],
          ),
        ),
      ),
    );
  }
}
