// next_page.dart
import 'package:flutter/material.dart';

class FullPage extends StatelessWidget {
  const FullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text('This is the next page!'),
      ),
    );
  }
}
