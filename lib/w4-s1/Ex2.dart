import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add elevation for a shadow effect
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              height: 100, // Adjust the height as needed
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        title: 'Dart',
        description: 'The best object-oriented language',
        imagePath: 'assets1/dart.jpg',
      ),
      Product(
        title: 'Flutter',
        description: 'The best mobile framework',
        imagePath: 'assets1/flutter.png',
      ),
      Product(
        title: 'Firebase',
        description: 'The best cloud platform',
        imagePath: 'assets1/firebase.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}