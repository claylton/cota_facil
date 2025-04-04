import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:cota_facil/presentation/widgets/ui/composites/input_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// const List<String> currencyList = <String>['AUD', 'BGN', 'BRL', 'CAD'];
const List<String> currencyList1 = <String>['AUD', 'BGN', 'BRL', 'CAD'];

class _HomePageState extends State<HomePage> {
  String? selectedCurrency;
  String? selectedCurrency1;
  // final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Converter Moeda"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputValueWidget(
              selectedCurrency: selectedCurrency ?? "",
              onCurrencyChanged: (String? newCurrency) {
                if (newCurrency != null) {
                  setState(() {
                    selectedCurrency = newCurrency;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              "• USD 0 = R\$ 0",
              style: GoogleFonts.roboto(
                color: ColorPalette.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
