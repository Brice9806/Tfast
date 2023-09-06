import 'package:easy_splash_screen/easy_splash_screen.dart';

import '../Wpage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/t-fast.png"),
      logoWidth: 300,
      title: const Text(
        "Le Transport et le Confort en Un",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const Wpage(),
      durationInSeconds: 5,
    );
  }
}
