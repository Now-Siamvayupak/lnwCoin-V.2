class SearchModel {
  List<Coin>? coins;

  SearchModel({this.coins});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      coins: json['coins'] != null ? (json['coins'] as List).map((i) => Coin.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coins != null) {
      data['coins'] = this.coins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coin {
  String? id;
  String? large;
  int? market_cap_rank;
  String? name;
  String? symbol;
  String? thumb;
  int? isFav;

  Coin({this.id, this.large, this.market_cap_rank, this.name, this.symbol, this.thumb, this.isFav});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      large: json['large'],
      market_cap_rank: json['market_cap_rank'],
      name: json['name'],
      symbol: json['symbol'],
      thumb: json['thumb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['large'] = this.large;
    data['market_cap_rank'] = this.market_cap_rank;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['thumb'] = this.thumb;
    return data;
  }

  factory Coin.fromDBJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      large: json['large'],
      market_cap_rank: json['market_cap_rank'],
      name: json['name'],
      symbol: json['symbol'],
      thumb: json['thumb'],
      isFav: json['isFav'],
    );
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['large'] = this.large;
    data['market_cap_rank'] = this.market_cap_rank;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['thumb'] = this.thumb;
    data['isFav'] = this.isFav;
    return data;
  }
}
