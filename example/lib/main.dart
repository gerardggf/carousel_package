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
            const Text('hola1'),
            Carousel(
              height: 200,
              images: [
                Image.network('https://www.gstatic.com/webp/gallery/1.jpg'),
                Image.network('https://www.gstatic.com/webp/gallery/2.jpg'),
                Image.network('https://www.gstatic.com/webp/gallery/3.jpg'),
              ],
              label: ['holaa', null, null],
            ),
            const Text('hola2'),
          ],
        ),
      ),
    );
  }
}
