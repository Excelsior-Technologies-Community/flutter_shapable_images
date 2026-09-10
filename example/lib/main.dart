import 'package:flutter/material.dart';
import 'package:flutter_shapable_image/flutter_shapable_image.dart';

void main() {
  runApp(const ShapableImageExampleApp());
}

class ShapableImageExampleApp extends StatelessWidget {
  const ShapableImageExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shapable Image',
      home: const ShapableImageDemo(),
    );
  }
}

class ShapableImageDemo extends StatelessWidget {
  const ShapableImageDemo({super.key});

  static const String imageUrl =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapable Image'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Circle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const ShapableImage(
                imageUrl: imageUrl,
                width: 140,
                height: 140,
                shape: ImageShape.circle,
                alignment: Alignment.topCenter, // shows more top, crops more bottom
              ),
              const SizedBox(height: 32),
              const Text(
                'Rectangle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const ShapableImage(
                imageUrl: imageUrl,
                width: 180,
                shape: ImageShape.rectangle,
                fit: BoxFit.contain, // no crop
              ),

              const SizedBox(height: 32),
              const Text(
                'Rounded Rectangle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const ShapableImage(
                imageUrl: imageUrl,
                width: 180,
                shape: ImageShape.roundedRectangle,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      ),
    );
  }
}