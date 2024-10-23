// next_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FullPage extends StatelessWidget {
  const FullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Nexus',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              child: SvgPicture.asset(
            'image/project.svg',
          )),
        ],
      ),
    );
  }
}
