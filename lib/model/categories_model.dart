class CategoriesModel {
  String? content;
  String? id;
  num? market_cap;
  num? market_cap_change_24h;
  String? name;
  List<String>? top_3_coins;
  String? updated_at;
  num? volume_24h;

  CategoriesModel({this.content, this.id, this.market_cap, this.market_cap_change_24h, this.name, this.top_3_coins, this.updated_at, this.volume_24h});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      content: json['content'],
      id: json['id'],
      market_cap: json['market_cap'],
      market_cap_change_24h: json['market_cap_change_24h'],
      name: json['name'],
      top_3_coins: json['top_3_coins'] != null ? new List<String>.from(json['top_3_coins']) : null,
      updated_at: json['updated_at'],
      volume_24h: json['volume_24h'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['market_cap'] = this.market_cap;
    data['market_cap_change_24h'] = this.market_cap_change_24h;
    data['name'] = this.name;
    data['updated_at'] = this.updated_at;
    data['volume_24h'] = this.volume_24h;
    data['content'] = this.content;
    if (this.top_3_coins != null) {
      data['top_3_coins'] = this.top_3_coins;
    }
    return data;
  }
}
