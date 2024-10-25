import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(100, 50),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                ),
                color: Color(0xfff4f9ff),
              ),
              height: 400,
              width: 350,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(60, 20),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff4f9ff),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                "Follower",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(90, 20),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff4f9ff),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "10000",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(-50, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0x5fe76f00),
                          ),
                          width: 100,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'image/java.svg',
                                width: 27,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Java",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffe76f00),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0x5f70AD51),
                          ),
                          width: 150,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'image/spring.svg',
                                width: 27,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Spring",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff70AD51),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'image/profile.svg',
            height: 200,
          ),
        ],
      ),
    );
  }
}
