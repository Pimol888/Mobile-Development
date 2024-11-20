import 'package:flutter/material.dart';
import 'dart:math';

// Enum for food categories
enum FoodCategory {
  appetizer(Icons.fastfood, "Appetizer"),
  mainCourse(Icons.local_dining, "Main Course"),
  dessert(Icons.cake, "Dessert");

  final IconData icon;
  final String displayName;

  const FoodCategory(this.icon, this.displayName);
}

// StatelessWidget for each food item
class FoodCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final FoodCategory category;
  final double? price; // Optional property

  const FoodCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.category,
    this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch alignment
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 300),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Icon(category.icon, color: Colors.grey[600]),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (price != null)
                  Text(
                    "\$${price!.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Main Widget displaying a list of FoodCards
class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pimol House"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        // Make it scrollable
        child: ListView(
          children: const [
            FoodCard(
              title: "Amok",
              description: "It made from Fish.",
              imagePath: 'assets/amok.jpg',
              category: FoodCategory.appetizer,
              price: 5.00,
            ),
            SizedBox(height: 12),
            FoodCard(
              title: "Terk Kroueng",
              description: "Juicy with side vegetables.",
              imagePath: 'assets/terkkroeung.jpg',
              category: FoodCategory.mainCourse,
              price: 5.00,
            ),
            SizedBox(height: 12),
            FoodCard(
              title: "Somlor Korko",
              description: "Heaven of vegetables.",
              imagePath: 'assets/ChocolateCake.jpg',
              category: FoodCategory.dessert,
              price: 5.00,
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: FoodMenuScreen(),
      debugShowCheckedModeBanner: false,
    ));