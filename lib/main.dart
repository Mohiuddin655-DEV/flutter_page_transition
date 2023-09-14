import 'package:flutter/material.dart';
import 'package:flutter_page_transition/a.dart';

void main() => runApp(const Application());

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Page Transitions App',
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}
