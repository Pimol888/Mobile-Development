import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pimol App '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bonjour, je m_appelle Pimol!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 80,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Boite d_amour',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const MyCustomWidget(
                text: 'Widget Personnalise',
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final String text;
  final Color color;

  const MyCustomWidget({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(16),
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}