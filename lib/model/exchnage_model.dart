import 'package:lnwcoin/model/coin_detail_model.dart';

class ExchangeModel {
  String? name;
  List<Ticker>? tickers;

  ExchangeModel({this.name, this.tickers});

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      name: json['name'],
      tickers: json['tickers'] != null ? (json['tickers'] as List).map((i) => Ticker.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
