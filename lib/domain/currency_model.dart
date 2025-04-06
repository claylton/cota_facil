class CurrencyModel {
  final Map<String, double> data;

  CurrencyModel({required this.data});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    final Map<String, double> parsedData = {};
    (json['data'] as Map<String, dynamic>).forEach((key, value) {
      parsedData[key] = value;
    });
    return CurrencyModel(data: parsedData);
  }
}
