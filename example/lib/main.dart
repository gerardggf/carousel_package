import 'package:customizable_carousel/customizable_carousel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Text 1'),
            Carousel(
              items: [
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/1.jpg',
                  ),
                  label: 'Image 1',
                  onTap: () {
                    if (kDebugMode) {
                      print('1');
                    }
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/2.jpg',
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print('2');
                    }
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/3.jpg',
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print('3');
                    }
                  },
                  label: 'Image 3',
                ),
              ],
            ),
            const Text('Text 2'),
          ],
        ),
      ),
    );
  }
}
