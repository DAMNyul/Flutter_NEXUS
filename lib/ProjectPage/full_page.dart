import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullPage extends StatelessWidget {
  const FullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final double boxSize = screenSize.width * 0.25;
    final double topPosition = screenSize.height * 0.1;
    final double leftPosition = screenSize.width * 0.07;

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
            top: topPosition,
            left: leftPosition,
            child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(0xFFFFF7E3),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'image/project.svg',
                    color: const Color(0xffFF9900),
                    width: boxSize * 0.65,
                    height: boxSize * 0.65,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
