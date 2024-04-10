import 'package:lnwcoin/model/coin_detail_model.dart';

class ExchangeTickerModel {
  String? name;
  List<Ticker>? tickers;

  ExchangeTickerModel({this.name, this.tickers});

  factory ExchangeTickerModel.fromJson(Map<String, dynamic> json) {
    return ExchangeTickerModel(
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
