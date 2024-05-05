import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
          () {
        Navigator.pushReplacementNamed(context, '/gourmet');
      },
    );

    return Scaffold(
      backgroundColor: Color(020202),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                '居酒屋 in Tokyo',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'pretendard',
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
            Image.asset('assets/img_splash.jpg'),
          ],
        ),
      ),
    );
  }
}
