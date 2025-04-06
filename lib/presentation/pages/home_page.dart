import 'package:cota_facil/data/currency_repository.dart';
import 'package:cota_facil/domain/currency_model.dart';
import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:cota_facil/presentation/widgets/ui/composites/input_value_widget.dart';
import 'package:cota_facil/presentation/widgets/ui/composites/result_value_widget.dart';
import 'package:cota_facil/presentation/widgets/ui/primitives/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCurrency, selectedCurrencyResult;
  bool isLoading = false;
  CurrencyModel? currencyValueResponse;
  double? currencyValue;
  double inputCurrencyValue = 0.0;
  double? convertedValue;
  bool showCurrencyInfo = false;
  late MoneyMaskedTextController moneyControllerInput;
  late MoneyMaskedTextController moneyControllerResult;

  @override
  void initState() {
    super.initState();
    moneyControllerInput = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
    moneyControllerResult = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  }

  double get exchange => (currencyValue ?? 0) * inputCurrencyValue;

  void loadCurrenciesInfo() async {
    setState(() {
      isLoading = true;
    });

    currencyValueResponse = await loadCurrenciesInfoRequest(
      baseCurrency: selectedCurrency ?? "",
      currencies: selectedCurrencyResult ?? "",
    );

    setState(() {
      currencyValue = currencyValueResponse?.data[selectedCurrencyResult];
      showCurrencyInfo = true;
      isLoading = false;
    });
  }

  void resetCurrencyInput() {
    setState(() {
      currencyValue = null;
      convertedValue = null;
      showCurrencyInfo = false;
      currencyValueResponse = null;
      inputCurrencyValue = 0.0;
      selectedCurrencyResult = null;
      moneyControllerInput.updateValue(0.0);
      moneyControllerResult.updateValue(0.0);
    });
  }

  void resetCurrencyResult() {
    setState(() {
      currencyValue = null;
      convertedValue = null;
      showCurrencyInfo = false;
      moneyControllerResult.updateValue(0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = !((selectedCurrency?.isNotEmpty == true) && (selectedCurrencyResult?.isNotEmpty == true) && (inputCurrencyValue > 0));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Converter Moeda"),
        backgroundColor: ColorPalette.withe,
        centerTitle: true,
      ),
      backgroundColor: ColorPalette.withe,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputValueWidget(
                      moneyController: moneyControllerInput,
                      selectedCurrencyCode: selectedCurrency ?? "",
                      onCurrencyChanged: (String? newCurrency) {
                        setState(() {
                          selectedCurrency = newCurrency?.split(')').first.replaceAll('(', '');
                          if (convertedValue == null) {
                            resetCurrencyInput();
                          }
                        });
                      },
                      onValueChanged: (value) {
                        setState(() {
                          inputCurrencyValue = value;
                        });
                      },
                    ),
                    if (showCurrencyInfo) ...[
                      const SizedBox(height: 20),
                      Text(
                        "• $selectedCurrency 1 = $selectedCurrencyResult $currencyValue",
                        style: GoogleFonts.roboto(
                          color: ColorPalette.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    ResultValueWidget(
                      moneyController: moneyControllerResult,
                      selectedCurrencyCode: selectedCurrencyResult ?? "",
                      onCurrencyChanged: (String? newCurrency) {
                        setState(() {
                          selectedCurrencyResult = newCurrency?.split(')').first.replaceAll('(', '');
                          if (convertedValue == null) {
                            resetCurrencyResult();
                          }
                        });
                      },
                      convertedValue: exchange,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButtonWidget(
                  disabled: isButtonDisabled,
                  onPressed: loadCurrenciesInfo,
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: ColorPalette.black.withAlpha((0.5 * 255).toInt()),
              child: Center(
                child: CircularProgressIndicator(color: ColorPalette.primary100),
              ),
            ),
        ],
      ),
    );
  }
}
