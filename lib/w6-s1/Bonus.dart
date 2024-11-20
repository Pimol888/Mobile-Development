import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0;
  double _fahrenheit = 0;

  void _calculateFahrenheit() {
    setState(() {
      _fahrenheit = (_celsius * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _celsius = double.tryParse(value) ?? 0.0;
                  _calculateFahrenheit();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Temperature in Celsius',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Temperature in Fahrenheit: ${_fahrenheit.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Container( ),
  ));
}