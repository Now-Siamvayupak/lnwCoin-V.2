import 'package:lnwcoin/model/coin_detail_model.dart';

class ExchangeDetailResponse {
  String? alert_notice;
  bool? centralized;
  String? country;
  String? description;
  String? facebook_url;
  bool? has_trading_incentive;
  String? image;
  String? name;
  String? other_url_1;
  String? other_url_2;
  String? public_notice;
  String? reddit_url;
  String? slack_url;
  List<StatusUpdate>? status_updates;
  String? telegram_url;
  List<Ticker>? tickers;
  num? trade_volume_24h_btc;
  num? trade_volume_24h_btc_normalized;
  num? trust_score;
  num? trust_score_rank;
  String? twitter_handle;
  String? url;
  num? year_established;

  ExchangeDetailResponse(
      {this.alert_notice,
      this.centralized,
      this.country,
      this.description,
      this.facebook_url,
      this.has_trading_incentive,
      this.image,
      this.name,
      this.other_url_1,
      this.other_url_2,
      this.public_notice,
      this.reddit_url,
      this.slack_url,
      this.status_updates,
      this.telegram_url,
      this.tickers,
      this.trade_volume_24h_btc,
      this.trade_volume_24h_btc_normalized,
      this.trust_score,
      this.trust_score_rank,
      this.twitter_handle,
      this.url,
      this.year_established});

  factory ExchangeDetailResponse.fromJson(Map<String, dynamic> json) {
    return ExchangeDetailResponse(
      alert_notice: json['alert_notice'],
      centralized: json['centralized'],
      country: json['country'],
      description: json['description'],
      facebook_url: json['facebook_url'],
      has_trading_incentive: json['has_trading_incentive'],
      image: json['image'],
      name: json['name'],
      other_url_1: json['other_url_1'],
      other_url_2: json['other_url_2'],
      public_notice: json['public_notice'],
      reddit_url: json['reddit_url'],
      slack_url: json['slack_url'],
      status_updates: json['status_updates'] != null ? (json['status_updates'] as List).map((i) => StatusUpdate.fromJson(i)).toList() : null,
      telegram_url: json['telegram_url'],
      tickers: json['tickers'] != null ? (json['tickers'] as List).map((i) => Ticker.fromJson(i)).toList() : null,
      trade_volume_24h_btc: json['trade_volume_24h_btc'],
      trade_volume_24h_btc_normalized: json['trade_volume_24h_btc_normalized'],
      trust_score: json['trust_score'],
      trust_score_rank: json['trust_score_rank'],
      twitter_handle: json['twitter_handle'],
      url: json['url'],
      year_established: json['year_established'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alert_notice'] = this.alert_notice;
    data['centralized'] = this.centralized;
    data['country'] = this.country;
    data['description'] = this.description;
    data['facebook_url'] = this.facebook_url;
    data['has_trading_incentive'] = this.has_trading_incentive;
    data['image'] = this.image;
    data['name'] = this.name;
    data['other_url_1'] = this.other_url_1;
    data['other_url_2'] = this.other_url_2;
    data['public_notice'] = this.public_notice;
    data['reddit_url'] = this.reddit_url;
    data['slack_url'] = this.slack_url;
    data['telegram_url'] = this.telegram_url;
    data['trade_volume_24h_btc'] = this.trade_volume_24h_btc;
    data['trade_volume_24h_btc_normalized'] = this.trade_volume_24h_btc_normalized;
    data['trust_score'] = this.trust_score;
    data['trust_score_rank'] = this.trust_score_rank;
    data['twitter_handle'] = this.twitter_handle;
    data['url'] = this.url;
    data['year_established'] = this.year_established;
    if (this.status_updates != null) {
      data['status_updates'] = this.status_updates!.map((v) => v.toJson()).toList();
    }
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusUpdate {
  String? category;
  String? created_at;
  String? description;
  bool? pin;
  Project? project;
  String? user;
  String? user_title;

  StatusUpdate({this.category, this.created_at, this.description, this.pin, this.project, this.user, this.user_title});

  factory StatusUpdate.fromJson(Map<String, dynamic> json) {
    return StatusUpdate(
      category: json['category'],
      created_at: json['created_at'],
      description: json['description'],
      pin: json['pin'],
      project: json['project'] != null ? Project.fromJson(json['project']) : null,
      user: json['user'],
      user_title: json['user_title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['created_at'] = this.created_at;
    data['description'] = this.description;
    data['pin'] = this.pin;
    data['user'] = this.user;
    data['user_title'] = this.user_title;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  String? id;
  Image? image;
  String? name;
  String? type;

  Project({this.id, this.image, this.name, this.type});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
      name: json['name'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? large;
  String? small;
  String? thumb;

  Image({this.large, this.small, this.thumb});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      large: json['large'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}
