import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushNamed(context, 'home_page');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary100,
      body: Center(
        child: Text(
          "cota fácil",
          style: GoogleFonts.aclonica(
            fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            color: ColorPalette.withe,
          ),
        ),
      ),
    );
  }
}
