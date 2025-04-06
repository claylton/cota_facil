import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 40.0),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPalette.primary100,
      selectionColor: ColorPalette.primary100.withAlpha((0.3 * 255).toInt()),
      selectionHandleColor: ColorPalette.primary100,
    ));
