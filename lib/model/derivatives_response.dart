class DerivativesResponse {
  var country;
  var description;
  var id;
  var image;
  String? name;
  var number_of_futures_pairs;
  var number_of_perpetual_pairs;
  var open_interest_btc;
  var trade_volume_24h_btc;
  var url;
  var year_established;

  DerivativesResponse(
      {this.country,
      this.description,
      this.id,
      this.image,
      this.name,
      this.number_of_futures_pairs,
      this.number_of_perpetual_pairs,
      this.open_interest_btc,
      this.trade_volume_24h_btc,
      this.url,
      this.year_established});

  factory DerivativesResponse.fromJson(Map<String, dynamic> json) {
    return DerivativesResponse(
      country: json['country'],
      description: json['description'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      number_of_futures_pairs: json['number_of_futures_pairs'],
      number_of_perpetual_pairs: json['number_of_perpetual_pairs'],
      open_interest_btc: json['open_interest_btc'],
      trade_volume_24h_btc: json['trade_volume_24h_btc'],
      url: json['url'],
      year_established: json['year_established'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['number_of_futures_pairs'] = this.number_of_futures_pairs;
    data['number_of_perpetual_pairs'] = this.number_of_perpetual_pairs;
    data['open_interest_btc'] = this.open_interest_btc;
    data['trade_volume_24h_btc'] = this.trade_volume_24h_btc;
    data['url'] = this.url;
    data['year_established'] = this.year_established;
    return data;
  }
}
