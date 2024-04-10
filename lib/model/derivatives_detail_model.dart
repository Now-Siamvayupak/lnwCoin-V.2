class DerivativesDetailResponse {
  var country;
  var description;
  var image;
  var name;
  var number_of_futures_pairs;
  var number_of_perpetual_pairs;
  var open_interest_btc;
  List<Ticker>? tickers;
  var trade_volume_24h_btc;
  var url;
  var year_established;

  DerivativesDetailResponse(
      {this.country,
      this.description,
      this.image,
      this.name,
      this.number_of_futures_pairs,
      this.number_of_perpetual_pairs,
      this.open_interest_btc,
      this.tickers,
      this.trade_volume_24h_btc,
      this.url,
      this.year_established});

  factory DerivativesDetailResponse.fromJson(Map<String, dynamic> json) {
    return DerivativesDetailResponse(
      country: json['country'],
      description: json['description'],
      image: json['image'],
      name: json['name'],
      number_of_futures_pairs: json['number_of_futures_pairs'],
      number_of_perpetual_pairs: json['number_of_perpetual_pairs'],
      open_interest_btc: json['open_interest_btc'],
      tickers: json['tickers'] != null ? (json['tickers'] as List).map((i) => Ticker.fromJson(i)).toList() : null,
      trade_volume_24h_btc: json['trade_volume_24h_btc'],
      url: json['url'],
      year_established: json['year_established'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['description'] = this.description;
    data['image'] = this.image;
    data['name'] = this.name;
    data['number_of_futures_pairs'] = this.number_of_futures_pairs;
    data['number_of_perpetual_pairs'] = this.number_of_perpetual_pairs;
    data['open_interest_btc'] = this.open_interest_btc;
    data['trade_volume_24h_btc'] = this.trade_volume_24h_btc;
    data['url'] = this.url;
    data['year_established'] = this.year_established;
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ticker {
  String? base;
  double? bid_ask_spread;
  String? contract_type;
  ConvertedLast? converted_last;
  ConvertedLast? converted_volume;
  int? expired_at;
  double? funding_rate;
  double? h24_percentage_change;
  double? h24_volume;
  double? index;
  double? index_basis_percentage;
  double? last;
  int? last_traded;
  double? open_interest_usd;
  String? symbol;
  String? target;
  String? trade_url;

  Ticker(
      {this.base,
      this.bid_ask_spread,
      this.contract_type,
      this.converted_last,
      this.converted_volume,
      this.expired_at,
      this.funding_rate,
      this.h24_percentage_change,
      this.h24_volume,
      this.index,
      this.index_basis_percentage,
      this.last,
      this.last_traded,
      this.open_interest_usd,
      this.symbol,
      this.target,
      this.trade_url});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      base: json['base'],
      bid_ask_spread: json['bid_ask_spread'],
      contract_type: json['contract_type'],
      converted_last: json['converted_last'] != null ? ConvertedLast.fromJson(json['converted_last']) : null,
      converted_volume: json['converted_volume'] != null ? ConvertedLast.fromJson(json['converted_volume']) : null,
      expired_at: json['expired_at'],
      funding_rate: json['funding_rate'],
      h24_percentage_change: json['h24_percentage_change'],
      h24_volume: json['h24_volume'],
      index: json['index'],
      index_basis_percentage: json['index_basis_percentage'],
      last: json['last'],
      last_traded: json['last_traded'],
      open_interest_usd: json['open_interest_usd'],
      symbol: json['symbol'],
      target: json['target'],
      trade_url: json['trade_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['bid_ask_spread'] = this.bid_ask_spread;
    data['contract_type'] = this.contract_type;
    data['expired_at'] = this.expired_at;
    data['funding_rate'] = this.funding_rate;
    data['h24_percentage_change'] = this.h24_percentage_change;
    data['h24_volume'] = this.h24_volume;
    data['index'] = this.index;
    data['index_basis_percentage'] = this.index_basis_percentage;
    data['last'] = this.last;
    data['last_traded'] = this.last_traded;
    data['open_interest_usd'] = this.open_interest_usd;
    data['symbol'] = this.symbol;
    data['target'] = this.target;
    data['trade_url'] = this.trade_url;
    if (this.converted_last != null) {
      data['converted_last'] = this.converted_last!.toJson();
    }
    if (this.converted_volume != null) {
      data['converted_volume'] = this.converted_volume!.toJson();
    }
    return data;
  }
}

class ConvertedVolume {
  String? btc;
  String? eth;
  String? usd;

  ConvertedVolume({this.btc, this.eth, this.usd});

  factory ConvertedVolume.fromJson(Map<String, dynamic> json) {
    return ConvertedVolume(
      btc: json['btc'],
      eth: json['eth'],
      usd: json['usd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usd'] = this.usd;
    return data;
  }
}

class ConvertedLast {
  String? btc;
  String? eth;
  String? usd;

  ConvertedLast({this.btc, this.eth, this.usd});

  factory ConvertedLast.fromJson(Map<String, dynamic> json) {
    return ConvertedLast(
      btc: json['btc'],
      eth: json['eth'],
      usd: json['usd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usd'] = this.usd;
    return data;
  }
}
