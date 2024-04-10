import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class Data {
  num? inr;
  num? inr_24h_change;
  num? inr_24h_vol;
  num? inr_market_cap;
  num? last_updated_at;

  Data({this.inr, this.inr_24h_change, this.inr_24h_vol, this.inr_market_cap, this.last_updated_at});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      inr: json['${appStore.mSelectedCurrency!.cc.validate()}'],
      inr_24h_change: json['${appStore.mSelectedCurrency!.cc.validate()}_24h_change'],
      inr_24h_vol: json['${appStore.mSelectedCurrency!.cc.validate()}_24h_vol'],
      inr_market_cap: json['${appStore.mSelectedCurrency!.cc.validate()}_market_cap'],
      last_updated_at: json['last_updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['${appStore.mSelectedCurrency!.cc.validate()}'] = this.inr;
    data['${appStore.mSelectedCurrency!.cc.validate()}_24h_change'] = this.inr_24h_change;
    data['${appStore.mSelectedCurrency!.cc.validate()}_24h_vol'] = this.inr_24h_vol;
    data['${appStore.mSelectedCurrency!.cc.validate()}_market_cap'] = this.inr_market_cap;
    data['last_updated_at'] = this.last_updated_at;
    return data;
  }
}
