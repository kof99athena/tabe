import 'package:flutter/material.dart';
import 'package:tabe/screen/gourmet_detail_screen.dart';
import 'package:tabe/screen/gourmet_screen.dart';
import 'package:tabe/screen/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: 'assets/config/.env');
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
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          dynamic gourmetItem = settings.arguments as dynamic;
          return MaterialPageRoute(builder: (context) {
            return GourmetDetailScreen(gourmetItem: gourmetItem);
          },);
        }
      },
    );
  }
}
