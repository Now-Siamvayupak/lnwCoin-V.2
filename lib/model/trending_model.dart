class TrendingModel {
  List<Coin>? coins;
  List<Object>? exchanges;
  Status? status;

  TrendingModel({this.coins, this.exchanges, this.status});

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      coins: json['coins'] != null ? (json['coins'] as List).map((i) => Coin.fromJson(i)).toList() : null,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      // exchanges: json['exchanges'] != null ? (json['exchanges'] as List).map((i) => Object.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coins != null) {
      data['coins'] = this.coins!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    /*if (this.exchanges != null) {
      data['exchanges'] = this.exchanges.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Coin {
  Item? item;

  Coin({this.item});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      item: json['item'] != null ? Item.fromJson(json['item']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  num? coin_id;
  String? id;
  String? large;
  num? market_cap_rank;
  String? name;
  num? price_btc;
  num? score;
  String? slug;
  String? small;
  String? symbol;
  String? thumb;

  Item({this.coin_id, this.id, this.large, this.market_cap_rank, this.name, this.price_btc, this.score, this.slug, this.small, this.symbol, this.thumb});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      coin_id: json['coin_id'],
      id: json['id'],
      large: json['large'],
      market_cap_rank: json['market_cap_rank'],
      name: json['name'],
      price_btc: json['price_btc'],
      score: json['score'],
      slug: json['slug'],
      small: json['small'],
      symbol: json['symbol'],
      thumb: json['thumb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin_id'] = this.coin_id;
    data['id'] = this.id;
    data['large'] = this.large;
    data['market_cap_rank'] = this.market_cap_rank;
    data['name'] = this.name;
    data['price_btc'] = this.price_btc;
    data['score'] = this.score;
    data['slug'] = this.slug;
    data['small'] = this.small;
    data['symbol'] = this.symbol;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Status {
  int? error_code;
  String? error_message;

  Status({this.error_code, this.error_message});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      error_code: json['error_code'],
      error_message: json['error_message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.error_code;
    data['error_message'] = this.error_message;
    return data;
  }
}
