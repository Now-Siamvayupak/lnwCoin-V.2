class CoinChartModel {
  List? prices;
  List? marketCaps;
  List? totalVolumes;

  CoinChartModel({this.prices, this.marketCaps, this.totalVolumes});

  CoinChartModel.fromJson(dynamic json) {
    prices = json["prices"] != null ? json["prices"] : [];
    marketCaps = json["market_caps"] != null ? json["market_caps"] : [];
    totalVolumes = json["total_volumes"] != null ? json["total_volumes"] : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["prices"] = prices;
    map["market_caps"] = marketCaps;
    map["total_volumes"] = totalVolumes;
    return map;
  }
}
