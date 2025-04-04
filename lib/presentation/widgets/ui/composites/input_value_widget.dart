import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:cota_facil/presentation/widgets/ui/primitives/country_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';

class InputValueWidget extends StatefulWidget {
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;

  const InputValueWidget({
    super.key,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  });

  @override
  State<InputValueWidget> createState() => _InputValueWidgetState();
}

class _InputValueWidgetState extends State<InputValueWidget> {
  late MoneyMaskedTextController moneyController;
  late String selectedCurrency;

  @override
  void initState() {
    super.initState();

    moneyController = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  }

  void handleCurrencyChange(String? newCurrency) {
    if (newCurrency != null) {
      setState(() {
        selectedCurrency = newCurrency;

        // Atualiza o símbolo da moeda no controller
        final value = moneyController.numberValue;
        moneyController.updateValue(0); // limpa antes de aplicar símbolo novo
        moneyController = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: '.',
          initialValue: value,
        );
      });

      widget.onCurrencyChanged(newCurrency);
    }
  }

  @override
  void dispose() {
    moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> currencyList = <String>['AUD', 'BGN', 'BRL', 'CAD'];

    moneyController.addListener(() {
      final newText = moneyController.text;
      moneyController.selection = TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all()),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CountryDropdownWidget(
              currencyList: currencyList,
              selectedCurrency: widget.selectedCurrency,
              onCurrencyChanged: handleCurrencyChange,
            ),
          ),
          Expanded(
            flex: 4,
            child: TextField(
              controller: moneyController,
              keyboardType: TextInputType.number,
              cursorColor: ColorPalette.primary100,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                labelText: "Quantidade desejada",
                labelStyle: GoogleFonts.roboto(color: ColorPalette.black),
                prefixText: "${widget.selectedCurrency} ",
                prefixStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
