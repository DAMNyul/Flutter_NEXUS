import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0x00f4f9ff),
            height: 300,
            width: 350,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 130,
              horizontal: 20,
            ),
          ),
          SvgPicture.asset(
            'image/profile.svg',
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
