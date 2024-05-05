import 'package:flutter/material.dart';
import 'package:tabe/screen/gourmet_screen.dart';
import 'package:tabe/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabe🍜 Tabe🍣',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/gourmet': (context) => GourmetScreen(),
      },
    );
  }
}
