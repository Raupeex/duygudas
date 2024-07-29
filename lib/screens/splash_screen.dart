import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login_register');
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation!,
          child: ClipOval(
            child: Image.asset(
              'assets/images/logog.png',
              width: 260.0,
              height: 260.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
