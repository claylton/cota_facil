import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorPalette.primary100),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Remove o arredondamento
          ),
        ),
      ),
      onPressed: () {},
      child: Container(
        height: 36,
        alignment: Alignment.center,
        child: Text(
          "Calcular",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorPalette.withe,
          ),
        ),
      ),
    );
  }
}
