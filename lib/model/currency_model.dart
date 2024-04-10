class CurrencyModel {
  String? cc;
  String? name;
  String? symbol;

  CurrencyModel({this.cc, this.name, this.symbol});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      cc: json['cc'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cc'] = this.cc;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}
