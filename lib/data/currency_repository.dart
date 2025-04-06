import 'dart:convert';

import 'package:cota_facil/domain/currency_model.dart';
import 'package:http/http.dart' as http;

const apiKey = String.fromEnvironment('apiKey');

Future<CurrencyModel> loadCurrenciesInfoRequest({required String baseCurrency, required String currencies}) async {
  final Map<String, String> requestHeaders = {
    'apikey': apiKey,
  };

  final queryParameters = {
    'base_currency': baseCurrency,
    'currencies': currencies,
  };

  final url = Uri.parse('https://api.freecurrencyapi.com/v1/latest').replace(queryParameters: queryParameters);

  final response = await http.get(url, headers: requestHeaders);

  if (response.statusCode == 200) {
    return CurrencyModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error.currency');
  }
}
