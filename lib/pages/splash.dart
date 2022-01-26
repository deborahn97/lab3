import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'category_list.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  late double scrHeight, scrWidth, resWidth;
  
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const CategoryList())
    );
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
    } else {
      resWidth = scrWidth * 0.75;
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFE1BEE7), Color(0xFF6A1B9A)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropShadowImage(
                  image: Image.asset('assets/images/splash.png', scale: 2.5),
                  borderRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(3, 3),
                  scale: 1,
                ),
                Text(
                  "DoughyGoodness Home Bakery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: resWidth * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                JumpingDotsProgressIndicator(
                  fontSize: resWidth * 0.1, 
                  color: Colors.white,
                ),
                Text(
                  "Version 0.1",
                  style: TextStyle(
                    fontSize: resWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}