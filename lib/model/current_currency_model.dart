class CurrentCurrencyModel {
  String? currency;
  num? currentValue;

  CurrentCurrencyModel({this.currency, this.currentValue});

  CurrentCurrencyModel.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    currentValue = json['currentValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['currentValue'] = this.currentValue;
    return data;
  }
}
