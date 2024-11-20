import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavoriteCard({super.key, required this.title, required this.description});

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.description),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: _toggleFavorite,
                ),
              ],
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Cards'),
        ),
        body: ListView(
          children: [
            FavoriteCard(
              title: 'Item 1',
              description: 'Description for Item 1',
            ),
            FavoriteCard(
              title: 'Item 2',
              description: 'Description for Item 2',
            ),
            // Add more FavoriteCards as needed
          ],
        ),
      ),
    );
  }
}