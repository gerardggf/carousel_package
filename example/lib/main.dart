import 'package:carousel/carousel.dart';
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
              showPages: true,
              items: [
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/1.jpg',
                  ),
                  label: 'Image 1',
                  onTap: () {
                    print('1');
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/2.jpg',
                  ),
                  onTap: () {
                    print('2');
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/3.jpg',
                  ),
                  onTap: () {
                    print('3');
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
