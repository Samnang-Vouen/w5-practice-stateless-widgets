import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
            backgroundColor: Colors.pink[200],
          ),
          body: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(
                  imagePath: Product.dart.image,
                  title: Product.dart.title,
                  subtitle: Product.dart.description,
                ),
                SizedBox(
                  height: 20,
                ),
                ProductCard(
                  imagePath: Product.flutter.image,
                  title: Product.flutter.title,
                  subtitle: Product.flutter.description,
                ),
                SizedBox(
                  height: 20,
                ),
                ProductCard(
                  imagePath: Product.firebase.image,
                  title: Product.firebase.title,
                  subtitle: Product.firebase.description,
                ),
              ],
            )
          ),
        ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 64, width: 64),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
