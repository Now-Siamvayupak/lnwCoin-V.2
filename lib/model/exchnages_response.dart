class ExchangesResponse {
  String? country;
  String? description;
  bool? has_trading_incentive;
  String? id;
  String? image;
  String? name;
  double? trade_volume_24h_btc;
  double? trade_volume_24h_btc_normalized;
  int? trust_score;
  int? trust_score_rank;
  String? url;
  int? year_established;

  ExchangesResponse(
      {this.country,
      this.description,
      this.has_trading_incentive,
      this.id,
      this.image,
      this.name,
      this.trade_volume_24h_btc,
      this.trade_volume_24h_btc_normalized,
      this.trust_score,
      this.trust_score_rank,
      this.url,
      this.year_established});

  factory ExchangesResponse.fromJson(Map<String, dynamic> json) {
    return ExchangesResponse(
      country: json['country'],
      description: json['description'],
      has_trading_incentive: json['has_trading_incentive'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      trade_volume_24h_btc: json['trade_volume_24h_btc'],
      trade_volume_24h_btc_normalized: json['trade_volume_24h_btc_normalized'],
      trust_score: json['trust_score'],
      trust_score_rank: json['trust_score_rank'],
      url: json['url'],
      year_established: json['year_established'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['description'] = this.description;
    data['has_trading_incentive'] = this.has_trading_incentive;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['trade_volume_24h_btc'] = this.trade_volume_24h_btc;
    data['trade_volume_24h_btc_normalized'] = this.trade_volume_24h_btc_normalized;
    data['trust_score'] = this.trust_score;
    data['trust_score_rank'] = this.trust_score_rank;
    data['url'] = this.url;
    data['year_established'] = this.year_established;
    return data;
  }
}
