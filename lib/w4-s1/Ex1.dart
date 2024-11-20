import 'package:flutter/material.dart';
import 'dart:math';

class Hobby {
  final String title;
  final IconData icon;
  final Color color;

  const Hobby({
    required this.title,
    required this.icon,
    required this.color,
  });
  }
class HobbyCard extends StatelessWidget {
  final Hobby hobby;

  const HobbyCard({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: hobby.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hobby.icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              hobby.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
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
    final hobbies = [
      Hobby(title: 'Travelling', icon: Icons.flight_takeoff, color: Colors.blue),
      Hobby(title: 'Skating', icon: Icons.skateboarding, color: Colors.green),
      // Add more hobbies here
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Hobbies'),
        ),
        body: ListView.builder(
          itemCount: hobbies.length,
          itemBuilder: (context, index) {
            return HobbyCard(hobby: hobbies[index]);
          },
        ),
      ),
    );
  }
}