import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mahmoud/screans/wellcome/welcome_one.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WellcomeOne())),
    );
    Timer(const Duration(milliseconds: 10), (() {
      setState(() {});
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.9],
            tileMode: TileMode.clamp,
            colors: [
              Color.fromARGB(255, 3, 105, 202),
              Colors.black,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("assets/splash.webp"),
              radius: 70,
            ),
            Positioned(
              bottom: 260,
              child: Text(
                "AUXILO",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
