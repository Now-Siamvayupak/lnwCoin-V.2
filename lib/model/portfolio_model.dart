import 'package:cloud_firestore/cloud_firestore.dart';

class PortfolioModel {
  Timestamp? createdDate;
  Timestamp? date;
  String? name;
  String? coinIcon;
  String? coinSymbol;
  String? buyInCurrency;
  String? coinId;
  num? noOfUnits;
  String? notes;
  num? perCoin;
  num? price;
  String? uid;
  Timestamp? updatedDate;
  List<dynamic>? currentCurrencyList;

  PortfolioModel(
      {this.createdDate,
      this.buyInCurrency,
      this.coinIcon,
      this.coinSymbol,
      this.date,
      this.name,
      this.coinId,
      this.noOfUnits,
      this.notes,
      this.perCoin,
      this.price,
      this.uid,
      this.updatedDate,
      this.currentCurrencyList});

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      createdDate: json['createdDate'],
      date: json['date'],
      name: json['name'],
      coinIcon: json['coinIcon'],
      coinSymbol: json['coinSymbol'],
      buyInCurrency: json['buyInCurrency'],
      coinId: json['coinId'],
      noOfUnits: json['noOfUnits'],
      notes: json['notes'],
      perCoin: json['perCoin'],
      price: json['price'],
      uid: json['uid'],
      updatedDate: json['updatedDate'],
      currentCurrencyList: json['currentCurrencyList'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['date'] = this.date;
    data['name'] = this.name;
    data['coinIcon'] = this.coinIcon;
    data['coinId'] = this.coinId;
    data['coinSymbol'] = this.coinSymbol;
    data['buyInCurrency'] = this.buyInCurrency;
    data['coinIcon'] = this.coinIcon;
    data['noOfUnits'] = this.noOfUnits;
    data['notes'] = this.notes;
    data['perCoin'] = this.perCoin;
    data['price'] = this.price;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['currentCurrencyList'] = this.currentCurrencyList;
    return data;
  }
}
