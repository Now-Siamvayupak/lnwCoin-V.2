import 'package:lnwcoin/model/coin_list_model.dart';
import 'package:lnwcoin/model/trending_model.dart';

class DashboardResponse {
  List<CoinListModel>? coinModel;
  TrendingModel? trendingCoins;

  DashboardResponse({this.coinModel, this.trendingCoins});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      coinModel: json['CoinListModel'] != null ? (json['CoinListModel'] as List).map((i) => CoinListModel.fromJson(i)).toList() : null,
      trendingCoins: json['trendingCoins'] != null ? (TrendingModel.fromJson(json['trendingCoins'])) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.coinModel != null) {
      data['coinModel'] = this.coinModel!.map((v) => v.toJson()).toList();
    }
    if (this.trendingCoins != null) {
      data['trendingCoins'] = trendingCoins!.toJson();
    }
    return data;
  }
}
