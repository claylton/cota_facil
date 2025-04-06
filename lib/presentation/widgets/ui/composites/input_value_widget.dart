import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:cota_facil/presentation/common/utils/currency_utils.dart';
import 'package:cota_facil/presentation/widgets/ui/primitives/country_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputValueWidget extends StatefulWidget {
  final String selectedCurrencyCode;
  final Function(String?) onCurrencyChanged;
  final void Function(double value)? onValueChanged;
  late MoneyMaskedTextController moneyController;

  InputValueWidget({
    super.key,
    required this.selectedCurrencyCode,
    required this.onCurrencyChanged,
    required this.onValueChanged,
    required this.moneyController,
  });

  @override
  State<InputValueWidget> createState() => _InputValueWidgetState();
}

class _InputValueWidgetState extends State<InputValueWidget> {
  late String selectedCurrency;

  void handleCurrencyChange(String? newCurrency) {
    if (newCurrency != null) {
      setState(() {
        selectedCurrency = newCurrency;

        // Atualiza o símbolo da moeda no controller
        final value = widget.moneyController.numberValue;
        widget.moneyController.updateValue(0); // limpa antes de aplicar símbolo novo
        widget.moneyController = MoneyMaskedTextController(
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
    widget.moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.moneyController.addListener(() {
      final newText = widget.moneyController.text;
      widget.moneyController.selection = TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      );

      final value = widget.moneyController.numberValue;
      widget.onValueChanged?.call(value);
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
              currencyList: CurrencyUtils.currencyList,
              selectedCurrency: widget.selectedCurrencyCode,
              onCurrencyChanged: handleCurrencyChange,
            ),
          ),
          Expanded(
            flex: 4,
            child: TextField(
              enabled: widget.selectedCurrencyCode.isNotEmpty,
              controller: widget.moneyController,
              keyboardType: TextInputType.number,
              cursorColor: ColorPalette.primary100,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                labelText: "Escolha a moeda e digite o valor",
                labelStyle: GoogleFonts.roboto(color: ColorPalette.black),
                prefixText: CurrencyUtils.getCurrencySymbols(currencyCode: widget.selectedCurrencyCode),
                prefixStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
