import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUSE Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _carousel1Index = 0;
  int _carousel2Index = 0;
  int _carousel3Index = 0;
  int _carousel4Index = 0;

  final List<String> _carousel1Images = [
    'slide1.png',
    'slide2.png',
    'slide3.png',
  ];

  final List<String> _carousel2Images = [
    'slide4.png',
    'slide5.png',
    'slide6.png',
  ];

  final List<String> _carousel3Images = [
    'slide7.png',
    'slide8.png',
    'slide9.png',
  ];

  final List<String> _carousel4Images = [
    'slide10.png',
    'slide11.png',
    'slide12.png',
  ];

  void _nextImage(int carouselIndex) {
    setState(() {
      if (carouselIndex == 1) {
        _carousel1Index = (_carousel1Index + 1) % _carousel1Images.length;
      } else if (carouselIndex == 2) {
        _carousel2Index = (_carousel2Index + 1) % _carousel2Images.length;
      } else if (carouselIndex == 3) {
        _carousel3Index = (_carousel3Index + 1) % _carousel3Images.length;
      } else if (carouselIndex == 4) {
        _carousel4Index = (_carousel4Index + 1) % _carousel4Images.length;
      }
    });
  }

  void _previousImage(int carouselIndex) {
    setState(() {
      if (carouselIndex == 1) {
        _carousel1Index = (_carousel1Index - 1) % _carousel1Images.length;
        if (_carousel1Index < 0) {
          _carousel1Index = _carousel1Images.length - 1;
        }
      } else if (carouselIndex == 2) {
        _carousel2Index = (_carousel2Index - 1) % _carousel2Images.length;
        if (_carousel2Index < 0) {
          _carousel2Index = _carousel2Images.length - 1;
        }
      } else if (carouselIndex == 3) {
        _carousel3Index = (_carousel3Index - 1) % _carousel3Images.length;
        if (_carousel3Index < 0) {
          _carousel3Index = _carousel3Images.length - 1;
        }
      } else if (carouselIndex == 4) {
        _carousel4Index = (_carousel4Index - 1) % _carousel4Images.length;
        if (_carousel4Index < 0) {
          _carousel4Index = _carousel4Images.length - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are you wearing?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Carousel(
              images: _carousel1Images,
              currentIndex: _carousel1Index,
              onNext: () => _nextImage(1),
              onPrevious: () => _previousImage(1),
            ),
            Carousel(
              images: _carousel2Images,
              currentIndex: _carousel2Index,
              onNext: () => _nextImage(2),
              onPrevious: () => _previousImage(2),
            ),
            Carousel(
              images: _carousel3Images,
              currentIndex: _carousel3Index,
              onNext: () => _nextImage(3),
              onPrevious: () => _previousImage(3),
            ),
            Carousel(
              images: _carousel4Images,
              currentIndex: _carousel4Index,
              onNext: () => _nextImage(4),
              onPrevious: () => _previousImage(4),
            ),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const Carousel({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Carousel ${images.indexOf(images[currentIndex]) + 1}',
          //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPrevious,
                icon: const Icon(Icons.arrow_left),
              ),
              Image.asset(
                images[currentIndex],
                width: 175,
                height: 175,
                fit: BoxFit.cover,
              ),
              IconButton(
                onPressed: onNext,
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
