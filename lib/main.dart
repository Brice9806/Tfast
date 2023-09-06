import 'package:flutter/material.dart';
import 'package:mob/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Single Select Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashPage(),
      //supportedLocales: [Locale("fr", "FR"), Locale("eng", "ENG")],
    );
  }
}
