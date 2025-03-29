import 'package:cota_facil/presentation/pages/home_page.dart';
import 'package:cota_facil/presentation/pages/splash_screen_page.dart';
import 'package:cota_facil/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreenPage(),
        'home_page': (context) => const HomePage(title: 'Flutter Demo Home Page')
      },
    );
  }
}

