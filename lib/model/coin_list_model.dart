class CoinListModel {
  num? ath;
  num? ath_change_percentage;
  String? ath_date;
  num? atl;
  num? atl_change_percentage;
  String? atl_date;
  num? circulating_supply;
  num? current_price;
  num? fully_diluted_valuation;
  num? high_24h;
  String? id;
  String? image;
  String? last_updated;
  num? low_24h;
  num? market_cap;
  num? market_cap_change_24h;
  num? market_cap_change_percentage_24h;
  num? market_cap_rank;
  num? max_supply;
  String? name;
  num? price_change_24h;
  num? price_change_percentage_24h;
  Roi? roi;
  SparklineIn7d? sparkline_in_7d;
  String? symbol;
  num? total_supply;
  num? total_volume;
  num? price_change_percentage_1h_in_currency;
  num? price_change_percentage_24h_in_currency;
  num? price_change_percentage_7d_in_currency;
  num? price_change_percentage_14d_in_currency;
  num? price_change_percentage_30d_in_currency;
  num? price_change_percentage_200d_in_currency;
  num? price_change_percentage_1y_in_currency;

  CoinListModel({
    this.ath,
    this.ath_change_percentage,
    this.ath_date,
    this.atl,
    this.atl_change_percentage,
    this.atl_date,
    this.circulating_supply,
    this.current_price,
    this.fully_diluted_valuation,
    this.high_24h,
    this.id,
    this.image,
    this.last_updated,
    this.low_24h,
    this.market_cap,
    this.market_cap_change_24h,
    this.market_cap_change_percentage_24h,
    this.market_cap_rank,
    this.max_supply,
    this.name,
    this.price_change_24h,
    this.price_change_percentage_24h,
    this.roi,
    this.sparkline_in_7d,
    this.symbol,
    this.total_supply,
    this.total_volume,
    this.price_change_percentage_1h_in_currency,
    this.price_change_percentage_14d_in_currency,
    this.price_change_percentage_30d_in_currency,
    this.price_change_percentage_200d_in_currency,
    this.price_change_percentage_1y_in_currency,
    this.price_change_percentage_24h_in_currency,
    this.price_change_percentage_7d_in_currency,
  });

  factory CoinListModel.fromJson(Map<String, dynamic> json) {
    return CoinListModel(
      ath: json['ath'],
      ath_change_percentage: json['ath_change_percentage'],
      ath_date: json['ath_date'],
      atl: json['atl'],
      atl_change_percentage: json['atl_change_percentage'],
      atl_date: json['atl_date'],
      circulating_supply: json['circulating_supply'],
      current_price: json['current_price'],
      high_24h: json['high_24h'],
      id: json['id'],
      image: json['image'],
      last_updated: json['last_updated'],
      low_24h: json['low_24h'],
      market_cap: json['market_cap'],
      market_cap_change_24h: json['market_cap_change_24h'],
      market_cap_change_percentage_24h: json['market_cap_change_percentage_24h'],
      market_cap_rank: json['market_cap_rank'],
      max_supply: json['max_supply'],
      name: json['name'],
      price_change_percentage_1h_in_currency: json['price_change_percentage_1h_in_currency'],
      price_change_percentage_24h_in_currency: json['price_change_percentage_24h_in_currency'],
      price_change_percentage_7d_in_currency: json['price_change_percentage_7d_in_currency'],
      price_change_percentage_14d_in_currency: json['price_change_percentage_14d_in_currency'],
      price_change_percentage_30d_in_currency: json['price_change_percentage_30d_in_currency'],
      price_change_percentage_200d_in_currency: json['price_change_percentage_200d_in_currency'],
      price_change_percentage_1y_in_currency: json['price_change_percentage_1y_in_currency'],
      price_change_24h: json['price_change_24h'],
      price_change_percentage_24h: json['price_change_percentage_24h'],
      roi: json['roi'] != null ? Roi?.fromJson(json['roi']) : null,
      sparkline_in_7d: json['sparkline_in_7d'] != null ? SparklineIn7d.fromJson(json['sparkline_in_7d']) : null,
      symbol: json['symbol'],
      total_supply: json['total_supply'],
      total_volume: json['total_volume'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.ath_change_percentage;
    data['ath_date'] = this.ath_date;
    data['atl'] = this.atl;
    data['atl_change_percentage'] = this.atl_change_percentage;
    data['atl_date'] = this.atl_date;
    data['circulating_supply'] = this.circulating_supply;
    data['current_price'] = this.current_price;
    data['high_24h'] = this.high_24h;
    data['id'] = this.id;
    data['image'] = this.image;
    data['last_updated'] = this.last_updated;
    data['low_24h'] = this.low_24h;
    data['market_cap'] = this.market_cap;
    data['market_cap_change_24h'] = this.market_cap_change_24h;
    data['market_cap_change_percentage_24h'] = this.market_cap_change_percentage_24h;
    data['market_cap_rank'] = this.market_cap_rank;
    data['name'] = this.name;
    data['price_change_percentage_1h_in_currency'] = this.price_change_percentage_1h_in_currency;
    data['price_change_percentage_24h_in_currency'] = this.price_change_percentage_24h_in_currency;
    data['price_change_percentage_7d_in_currency'] = this.price_change_percentage_7d_in_currency;
    data['price_change_percentage_14d_in_currency'] = this.price_change_percentage_14d_in_currency;
    data['price_change_percentage_30d_in_currency'] = this.price_change_percentage_30d_in_currency;
    data['price_change_percentage_200d_in_currency'] = this.price_change_percentage_200d_in_currency;
    data['price_change_percentage_1y_in_currency'] = this.price_change_percentage_1y_in_currency;
    data['price_change_24h'] = this.price_change_24h;
    data['price_change_percentage_24h'] = this.price_change_percentage_24h;
    data['symbol'] = this.symbol;
    data['total_volume'] = this.total_volume;
    data['fully_diluted_valuation'] = this.fully_diluted_valuation;
    data['max_supply'] = this.max_supply;
    data['sparkline_in_7d'] = this.sparkline_in_7d;
    data['total_supply'] = this.total_supply;

    if (this.roi != null) {
      data['roi'] = this.roi!.toJson();
    }

    return data;
  }
}

class SparklineIn7d {
  List<double>? price;

  SparklineIn7d({this.price});

  factory SparklineIn7d.fromJson(Map<String, dynamic> json) {
    return SparklineIn7d(
      price: json['price'] != null ? new List<double>.from(json['price']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price;
    }
    return data;
  }
}

class Roi {
  String? currency;
  double? percentage;
  double? times;

  Roi({this.currency, this.percentage, this.times});

  factory Roi.fromJson(Map<String, dynamic> json) {
    return Roi(
      currency: json['currency'],
      percentage: json['percentage'],
      times: json['times'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['percentage'] = this.percentage;
    data['times'] = this.times;
    return data;
  }
}
