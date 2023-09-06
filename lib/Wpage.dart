import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'loginpage.dart';

class Wpage extends StatefulWidget {
  const Wpage({super.key});

  @override
  State<Wpage> createState() => _WpageState();
}

class _WpageState extends State<Wpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "",
              bodyWidget: Text(
                "Connectez-vous",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
              ),
              image: Image.asset("assets/images/onboarding/pict1.png")),
          PageViewModel(
              title: "",
              bodyWidget: Text(
                "Chosissez votre gare de départ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
              ),
              image: Image.asset("assets/images/onboarding/pict2.png")),
          PageViewModel(
              title: "",
              bodyWidget: Text(
                "Selectionnez votre destination",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
              ),
              image: Image.asset("assets/images/onboarding/pict3.png")),
          PageViewModel(
              title: "",
              bodyWidget: Text(
                "Profitez de votre voyage",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
              ),
              image: Image.asset("assets/images/onboarding/pict4.png")),
        ],
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Mylog()),
          );
        },
        onSkip: () {
          // On Skip button pressed
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
