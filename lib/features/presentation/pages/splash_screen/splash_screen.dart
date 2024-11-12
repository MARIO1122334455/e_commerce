import 'dart:async';

import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.signInRoute);
    });
    return Scaffold(
      body: Image.asset(
        ImageAssets.splashScreen,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
