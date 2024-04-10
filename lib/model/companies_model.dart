class CompaniesModel {
  List<Company>? companies;
  num? market_cap_dominance;
  num? total_holdings;
  num? total_value_usd;

  CompaniesModel({this.companies, this.market_cap_dominance, this.total_holdings, this.total_value_usd});

  factory CompaniesModel.fromJson(Map<String, dynamic> json) {
    return CompaniesModel(
      companies: json['companies'] != null ? (json['companies'] as List).map((i) => Company.fromJson(i)).toList() : null,
      market_cap_dominance: json['market_cap_dominance'],
      total_holdings: json['total_holdings'],
      total_value_usd: json['total_value_usd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['market_cap_dominance'] = this.market_cap_dominance;
    data['total_holdings'] = this.total_holdings;
    data['total_value_usd'] = this.total_value_usd;
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String? country;
  String? name;
  num? percentage_of_total_supply;
  String? symbol;
  num? total_current_value_usd;
  num? total_entry_value_usd;
  num? total_holdings;

  Company({this.country, this.name, this.percentage_of_total_supply, this.symbol, this.total_current_value_usd, this.total_entry_value_usd, this.total_holdings});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      country: json['country'],
      name: json['name'],
      percentage_of_total_supply: json['percentage_of_total_supply'],
      symbol: json['symbol'],
      total_current_value_usd: json['total_current_value_usd'],
      total_entry_value_usd: json['total_entry_value_usd'],
      total_holdings: json['total_holdings'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['name'] = this.name;
    data['percentage_of_total_supply'] = this.percentage_of_total_supply;
    data['symbol'] = this.symbol;
    data['total_current_value_usd'] = this.total_current_value_usd;
    data['total_entry_value_usd'] = this.total_entry_value_usd;
    data['total_holdings'] = this.total_holdings;
    return data;
  }
}
