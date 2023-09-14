import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0;

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _opty = 0;
    List<String> images = ["", "", "", "", "", ""];
    return SizedBox(
      height: 450,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          if (index == _currentPage) {
            _opty = 1;
            return Transform.scale(
              scale: 1.3,
              child: _pageImage(images[index], _opty),
            );
          } else if (index < _currentPage) {
            _opty = max(1 - (_currentPage - index), 0.5);
            return Transform.scale(
              scale: max(1.3 - (_currentPage - index), 0.8),
              child: _pageImage(images[index], _opty),
            );
          } else {
            _opty = max(1 - (index - _currentPage), 0.5);
            return Transform.scale(
              scale: max(1.3 - (index - _currentPage), 0.8),
              child: _pageImage(images[index], _opty),
            );
          }
        },
      ),
    );
  }

  _pageImage(String image, double opacity) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 80,
      ),
      child: Container(
        width: 120,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(opacity),
          borderRadius: BorderRadius.circular(25),
          // image: DecorationImage(
          //   image: NetworkImage(image),
          // ),
        ),
      ),
    );
  }
}
