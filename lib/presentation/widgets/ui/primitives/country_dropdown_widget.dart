// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:cota_facil/presentation/common/consts/color_palette.dart';
import 'package:cota_facil/presentation/common/utils/currency_utils.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class CountryDropdownWidget extends StatelessWidget {
  final List<String> currencyList;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;

  const CountryDropdownWidget({
    super.key,
    required this.currencyList,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      currencyList.map<MenuEntry>(
        (String currencyName) => MenuEntry(
          value: currencyName,
          label: currencyName,
          leadingIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CountryFlag.fromCountryCode(
              CurrencyUtils.getCountryCode(currencyCode: currencyName.split(')').first.replaceAll('(', '')),
              shape: const Circle(),
            ),
          ),
        ),
      ),
    );

    return Row(
      children: [
        Expanded(
          child: DropdownMenu(
            dropdownMenuEntries: menuEntries,
            width: double.infinity,
            onSelected: onCurrencyChanged,
            menuHeight: 340,
            menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(ColorPalette.withe)),
            leadingIcon: CountryFlag.fromCountryCode(
              CurrencyUtils.getCountryCode(currencyCode: selectedCurrency),
              shape: const Circle(),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none, // Remove a borda
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            trailingIcon: Icon(
              Icons.keyboard_arrow_down,
              size: 32,
              color: ColorPalette.black,
            ),
            selectedTrailingIcon: Icon(
              Icons.keyboard_arrow_up,
              size: 32,
              color: ColorPalette.black,
            ),
          ),
        ),
      ],
    );
  }
}
