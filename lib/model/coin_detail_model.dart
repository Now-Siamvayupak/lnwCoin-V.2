class CoinDetailModel {
  List<Object>? additional_notices;
  String? asset_platform_id;
  num? block_time_in_minutes;

  // List<String>? categories;
  num? coingecko_rank;
  num? coingecko_score;
  CommunityData? community_data;
  num? community_score;
  String? country_origin;
  Description? description;
  DeveloperData? developer_data;
  num? developer_score;
  String? genesis_date;
  String? hashing_algorithm;
  String? id;
  Images? image;
  String? last_updated;
  Links? links;
  num? liquidity_score;
  Localization? localization;
  num? market_cap_rank;
  MarketData? market_data;
  String? name;
  Platforms? platforms;
  num? public_numerest_score;
  PublicnumerestStats? public_numerest_stats;
  String? public_notice;
  num? sentiment_votes_down_percentage;
  num? sentiment_votes_up_percentage;
  List<Object>? status_updates;
  String? symbol;
  List<Ticker>? tickers;

  CoinDetailModel({
    this.additional_notices,
    this.asset_platform_id,
    this.block_time_in_minutes,
    // this.categories,
    this.coingecko_rank,
    this.coingecko_score,
    this.community_data,
    this.community_score,
    this.country_origin,
    this.description,
    this.developer_data,
    this.developer_score,
    this.genesis_date,
    this.hashing_algorithm,
    this.id,
    this.image,
    this.last_updated,
    this.links,
    this.liquidity_score,
    this.localization,
    this.market_cap_rank,
    this.market_data,
    this.name,
    this.platforms,
    this.public_numerest_score,
    this.public_numerest_stats,
    this.public_notice,
    this.sentiment_votes_down_percentage,
    this.sentiment_votes_up_percentage,
    this.status_updates,
    this.symbol,
    this.tickers,
  });

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) {
    return CoinDetailModel(
      // additional_notices: json['additional_notices'] != null ? (json['additional_notices'] as List).map((i) => Object.fromJson(i)).toList() : null,
      asset_platform_id: json['asset_platform_id'],
      block_time_in_minutes: json['block_time_in_minutes'],
      /* categories: json['categories'] != null
          ? new List<String>.from(json['categories'])
          : [],*/
      coingecko_rank: json['coingecko_rank'],
      coingecko_score: json['coingecko_score'],
      community_data: json['community_data'] != null ? CommunityData.fromJson(json['community_data']) : null,
      community_score: json['community_score'],
      country_origin: json['country_origin'],
      description: json['description'] != null ? Description.fromJson(json['description']) : null,
      developer_data: json['developer_data'] != null ? DeveloperData.fromJson(json['developer_data']) : null,
      developer_score: json['developer_score'],
      genesis_date: json['genesis_date'],
      hashing_algorithm: json['hashing_algorithm'],
      id: json['id'],
      image: json['image'] != null ? Images.fromJson(json['image']) : null,
      last_updated: json['last_updated'],
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      liquidity_score: json['liquidity_score'],
      localization: json['localization'] != null ? Localization.fromJson(json['localization']) : null,
      market_cap_rank: json['market_cap_rank'],
      market_data: json['market_data'] != null ? MarketData.fromJson(json['market_data']) : null,
      name: json['name'],
      platforms: json['platforms'] != null ? Platforms.fromJson(json['platforms']) : null,
      public_numerest_score: json['public_numerest_score'],
      public_numerest_stats: json['public_numerest_stats'] != null ? PublicnumerestStats.fromJson(json['public_numerest_stats']) : null,
      public_notice: json['public_notice'],
      sentiment_votes_down_percentage: json['sentiment_votes_down_percentage'],
      sentiment_votes_up_percentage: json['sentiment_votes_up_percentage'],
      // status_updates: json['status_updates'] != null ? (json['status_updates'] as List).map((i) => Object.fromJson(i)).toList() : null,
      symbol: json['symbol'],
      tickers: json['tickers'] != null ? (json['tickers'] as List).map((i) => Ticker.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset_platform_id'] = this.asset_platform_id;
    data['block_time_in_minutes'] = this.block_time_in_minutes;
    data['coingecko_rank'] = this.coingecko_rank;
    data['coingecko_score'] = this.coingecko_score;
    data['community_score'] = this.community_score;
    data['country_origin'] = this.country_origin;
    data['developer_score'] = this.developer_score;
    data['genesis_date'] = this.genesis_date;
    data['hashing_algorithm'] = this.hashing_algorithm;
    data['id'] = this.id;
    data['last_updated'] = this.last_updated;
    data['liquidity_score'] = this.liquidity_score;
    data['market_cap_rank'] = this.market_cap_rank;
    data['name'] = this.name;
    data['public_numerest_score'] = this.public_numerest_score;
    data['public_notice'] = this.public_notice;
    data['sentiment_votes_down_percentage'] = this.sentiment_votes_down_percentage;
    data['sentiment_votes_up_percentage'] = this.sentiment_votes_up_percentage;
    data['symbol'] = this.symbol;
    // if (this.additional_notices != null) {
    //     data['additional_notices'] = this.additional_notices!.map((v) => v!.toJson()).toList();
    // }
    /*if (this.categories != null) {
      data['categories'] = this.categories;
    }*/
    if (this.community_data != null) {
      data['community_data'] = this.community_data!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.developer_data != null) {
      data['developer_data'] = this.developer_data!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.localization != null) {
      data['localization'] = this.localization!.toJson();
    }
    if (this.market_data != null) {
      data['market_data'] = this.market_data!.toJson();
    }
    if (this.platforms != null) {
      data['platforms'] = this.platforms!.toJson();
    }
    if (this.public_numerest_stats != null) {
      data['public_numerest_stats'] = this.public_numerest_stats!.toJson();
    }
    /*  if (this.status_updates != null) {
      data['status_updates'] = this.status_updates.map((v) => v!.toJson()).toList();
    }
    */
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PublicnumerestStats {
  num? alexa_rank;
  String? bing_matches;

  PublicnumerestStats({this.alexa_rank, this.bing_matches});

  factory PublicnumerestStats.fromJson(Map<String, dynamic> json) {
    return PublicnumerestStats(
      alexa_rank: json['alexa_rank'],
      bing_matches: json['bing_matches'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alexa_rank'] = this.alexa_rank;
    data['bing_matches'] = this.bing_matches;
    return data;
  }
}

class Description {
  String? it;
  String? ar;
  String? de;
  String? en;
  String? es;
  String? fr;
  String? hu;
  String? id;
  String? ja;
  String? ko;
  String? nl;
  String? pl;
  String? pt;
  String? ro;
  String? ru;
  String? sv;
  String? th;
  String? tr;
  String? vi;
  String? zh;
  String? zh_tw;

  Description({
    this.it,
    this.ar,
    this.de,
    this.en,
    this.es,
    this.fr,
    this.hu,
    this.id,
    this.ja,
    this.ko,
    this.nl,
    this.pl,
    this.pt,
    this.ro,
    this.ru,
    this.sv,
    this.th,
    this.tr,
    this.vi,
    this.zh,
    this.zh_tw,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      it: json['it'],
      ar: json['ar'],
      de: json['de'],
      en: json['en'],
      es: json['es'],
      fr: json['fr'],
      hu: json['hu'],
      id: json['id'],
      ja: json['ja'],
      ko: json['ko'],
      nl: json['nl'],
      pl: json['pl'],
      pt: json['pt'],
      ro: json['ro'],
      ru: json['ru'],
      sv: json['sv'],
      th: json['th'],
      tr: json['tr'],
      vi: json['vi'],
      zh: json['zh'],
      zh_tw: json['zh-tw'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['`it`'] = this.it;
    data['ar'] = this.ar;
    data['de'] = this.de;
    data['en'] = this.en;
    data['es'] = this.es;
    data['fr'] = this.fr;
    data['hu'] = this.hu;
    data['id'] = this.id;
    data['ja'] = this.ja;
    data['ko'] = this.ko;
    data['nl'] = this.nl;
    data['pl'] = this.pl;
    data['pt'] = this.pt;
    data['ro'] = this.ro;
    data['ru'] = this.ru;
    data['sv'] = this.sv;
    data['th'] = this.th;
    data['tr'] = this.tr;
    data['vi'] = this.vi;
    data['zh'] = this.zh;
    data['zh-tw'] = this.zh_tw;
    return data;
  }
}

class Links {
  List<String>? announcement_url;
  var bitconumalk_thread_identifier;
  List<String>? blockchain_site;
  List<String>? chat_url;
  String? facebook_username;
  List<String>? homepage;
  List<String>? official_forum_url;
  ReposUrl? repos_url;
  var subreddit_url;
  var telegram_channel_identifier;
  var twitter_screen_name;

  Links(
      {this.announcement_url,
      this.bitconumalk_thread_identifier,
      this.blockchain_site,
      this.chat_url,
      this.facebook_username,
      this.homepage,
      this.official_forum_url,
      this.repos_url,
      this.subreddit_url,
      this.telegram_channel_identifier,
      this.twitter_screen_name});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      announcement_url: json['announcement_url'] != null ? new List<String>.from(json['announcement_url']) : null,
      bitconumalk_thread_identifier: json['bitconumalk_thread_identifier'],
      blockchain_site: json['blockchain_site'] != null ? new List<String>.from(json['blockchain_site']) : null,
      chat_url: json['chat_url'] != null ? new List<String>.from(json['chat_url']) : null,
      facebook_username: json['facebook_username'],
      homepage: json['homepage'] != null ? new List<String>.from(json['homepage']) : null,
      official_forum_url: json['official_forum_url'] != null ? new List<String>.from(json['official_forum_url']) : null,
      repos_url: json['repos_url'] != null ? ReposUrl.fromJson(json['repos_url']) : null,
      subreddit_url: json['subreddit_url'],
      telegram_channel_identifier: json['telegram_channel_identifier'],
      twitter_screen_name: json['twitter_screen_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bitconumalk_thread_identifier'] = this.bitconumalk_thread_identifier;
    data['facebook_username'] = this.facebook_username;
    data['subreddit_url'] = this.subreddit_url;
    data['telegram_channel_identifier'] = this.telegram_channel_identifier;
    data['twitter_screen_name'] = this.twitter_screen_name;
    if (this.announcement_url != null) {
      data['announcement_url'] = this.announcement_url;
    }
    if (this.blockchain_site != null) {
      data['blockchain_site'] = this.blockchain_site;
    }
    if (this.chat_url != null) {
      data['chat_url'] = this.chat_url;
    }
    if (this.homepage != null) {
      data['homepage'] = this.homepage;
    }
    if (this.official_forum_url != null) {
      data['official_forum_url'] = this.official_forum_url;
    }
    if (this.repos_url != null) {
      data['repos_url'] = this.repos_url!.toJson();
    }
    return data;
  }
}

class ReposUrl {
  List<Object>? bitbucket;
  List<String>? github;

  ReposUrl({this.bitbucket, this.github});

  factory ReposUrl.fromJson(Map<String, dynamic> json) {
    return ReposUrl(
      // bitbucket: json['bitbucket'] != null ? (json['bitbucket'] as List).map((i) => Object.fromJson(i)).toList() : null,
      github: json['github'] != null ? new List<String>.from(json['github']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.bitbucket != null) {
    //     data['bitbucket'] = this.bitbucket.map((v) => v!.toJson()).toList();
    // }
    if (this.github != null) {
      data['github'] = this.github;
    }
    return data;
  }
}

class MarketData {
  PriceChange24hInCurrency? ath;
  PriceChange24hInCurrency? ath_change_percentage;
  AthDate? ath_date;
  PriceChange24hInCurrency? atl;
  PriceChange24hInCurrency? atl_change_percentage;
  AthDate? atl_date;
  num? circulating_supply;
  PriceChange24hInCurrency? current_price;
  var fdv_to_tvl_ratio;
  PriceChange24hInCurrency? fully_diluted_valuation;
  PriceChange24hInCurrency? high_24h;
  var last_updated;
  PriceChange24hInCurrency? low_24h;
  PriceChange24hInCurrency? market_cap;
  num? market_cap_change_24h;
  PriceChange24hInCurrency? market_cap_change_24h_in_currency;
  num? market_cap_change_percentage_24h;
  PriceChange24hInCurrency? market_cap_change_percentage_24h_in_currency;
  num? market_cap_rank;
  num? max_supply;
  var mcap_to_tvl_ratio;
  num? price_change_24h;
  PriceChange24hInCurrency? price_change_24h_in_currency;
  num? price_change_percentage_14d;
  PriceChange24hInCurrency? price_change_percentage_14d_in_currency;
  PriceChange24hInCurrency? price_change_percentage_1h_in_currency;
  num? price_change_percentage_1y;
  PriceChange24hInCurrency? price_change_percentage_1y_in_currency;
  num? price_change_percentage_200d;
  PriceChange24hInCurrency? price_change_percentage_200d_in_currency;
  num? price_change_percentage_24h;
  PriceChange24hInCurrency? price_change_percentage_24h_in_currency;
  num? price_change_percentage_30d;
  PriceChange24hInCurrency? price_change_percentage_30d_in_currency;
  num? price_change_percentage_60d;
  PriceChange24hInCurrency? price_change_percentage_60d_in_currency;
  num? price_change_percentage_7d;
  PriceChange24hInCurrency? price_change_percentage_7d_in_currency;
  var roi;
  Sparkline7d? sparkline_7d;
  num? total_supply;
  var total_value_locked;
  PriceChange24hInCurrency? total_volume;

  MarketData(
      {this.ath,
      this.ath_change_percentage,
      this.ath_date,
      this.atl,
      this.atl_change_percentage,
      this.atl_date,
      this.circulating_supply,
      this.current_price,
      this.fdv_to_tvl_ratio,
      this.fully_diluted_valuation,
      this.high_24h,
      this.last_updated,
      this.low_24h,
      this.market_cap,
      this.market_cap_change_24h,
      this.market_cap_change_24h_in_currency,
      this.market_cap_change_percentage_24h,
      this.market_cap_change_percentage_24h_in_currency,
      this.market_cap_rank,
      this.max_supply,
      this.mcap_to_tvl_ratio,
      this.price_change_24h,
      this.price_change_24h_in_currency,
      this.price_change_percentage_14d,
      this.price_change_percentage_14d_in_currency,
      this.price_change_percentage_1h_in_currency,
      this.price_change_percentage_1y,
      this.price_change_percentage_1y_in_currency,
      this.price_change_percentage_200d,
      this.price_change_percentage_200d_in_currency,
      this.price_change_percentage_24h,
      this.price_change_percentage_24h_in_currency,
      this.price_change_percentage_30d,
      this.price_change_percentage_30d_in_currency,
      this.price_change_percentage_60d,
      this.price_change_percentage_60d_in_currency,
      this.price_change_percentage_7d,
      this.price_change_percentage_7d_in_currency,
      this.roi,
      this.sparkline_7d,
      this.total_supply,
      this.total_value_locked,
      this.total_volume});

  factory MarketData.fromJson(Map<String, dynamic> json) {
    return MarketData(
      ath: json['ath'] != null ? PriceChange24hInCurrency.fromJson(json['ath']) : null,
      ath_change_percentage: json['ath_change_percentage'] != null ? PriceChange24hInCurrency.fromJson(json['ath_change_percentage']) : null,
      ath_date: json['ath_date'] != null ? AthDate.fromJson(json['ath_date']) : null,
      atl: json['atl'] != null ? PriceChange24hInCurrency.fromJson(json['atl']) : null,
      atl_change_percentage: json['atl_change_percentage'] != null ? PriceChange24hInCurrency.fromJson(json['atl_change_percentage']) : null,
      atl_date: json['atl_date'] != null ? AthDate.fromJson(json['atl_date']) : null,
      circulating_supply: json['circulating_supply'],
      current_price: json['current_price'] != null ? PriceChange24hInCurrency.fromJson(json['current_price']) : null,
      fdv_to_tvl_ratio: json['fdv_to_tvl_ratio'],
      fully_diluted_valuation: json['fully_diluted_valuation'] != null ? PriceChange24hInCurrency.fromJson(json['fully_diluted_valuation']) : null,
      high_24h: json['high_24h'] != null ? PriceChange24hInCurrency.fromJson(json['high_24h']) : null,
      last_updated: json['last_updated'],
      low_24h: json['low_24h'] != null ? PriceChange24hInCurrency.fromJson(json['low_24h']) : null,
      market_cap: json['market_cap'] != null ? PriceChange24hInCurrency.fromJson(json['market_cap']) : null,
      market_cap_change_24h: json['market_cap_change_24h'],
      market_cap_change_24h_in_currency: json['market_cap_change_24h_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['market_cap_change_24h_in_currency']) : null,
      market_cap_change_percentage_24h: json['market_cap_change_percentage_24h'],
      market_cap_change_percentage_24h_in_currency:
          json['market_cap_change_percentage_24h_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['market_cap_change_percentage_24h_in_currency']) : null,
      market_cap_rank: json['market_cap_rank'],
      max_supply: json['max_supply'],
      mcap_to_tvl_ratio: json['mcap_to_tvl_ratio'],
      price_change_24h: json['price_change_24h'],
      price_change_24h_in_currency: json['price_change_24h_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_24h_in_currency']) : null,
      price_change_percentage_14d: json['price_change_percentage_14d'],
      price_change_percentage_14d_in_currency: json['price_change_percentage_14d_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_14d_in_currency']) : null,
      price_change_percentage_1h_in_currency: json['price_change_percentage_1h_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_1h_in_currency']) : null,
      price_change_percentage_1y: json['price_change_percentage_1y'],
      price_change_percentage_1y_in_currency: json['price_change_percentage_1y_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_1y_in_currency']) : null,
      price_change_percentage_200d: json['price_change_percentage_200d'],
      price_change_percentage_200d_in_currency: json['price_change_percentage_200d_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_200d_in_currency']) : null,
      price_change_percentage_24h: json['price_change_percentage_24h'],
      price_change_percentage_24h_in_currency: json['price_change_percentage_24h_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_24h_in_currency']) : null,
      price_change_percentage_30d: json['price_change_percentage_30d'],
      price_change_percentage_30d_in_currency: json['price_change_percentage_30d_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_30d_in_currency']) : null,
      price_change_percentage_60d: json['price_change_percentage_60d'],
      price_change_percentage_60d_in_currency: json['price_change_percentage_60d_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_60d_in_currency']) : null,
      price_change_percentage_7d: json['price_change_percentage_7d'],
      price_change_percentage_7d_in_currency: json['price_change_percentage_7d_in_currency'] != null ? PriceChange24hInCurrency.fromJson(json['price_change_percentage_7d_in_currency']) : null,
      roi: json['roi'],
      sparkline_7d: json['sparkline_7d'] != null ? Sparkline7d.fromJson(json['sparkline_7d']) : null,
      total_supply: json['total_supply'],
      total_value_locked: json['total_value_locked'],
      total_volume: json['total_volume'] != null ? PriceChange24hInCurrency.fromJson(json['total_volume']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['circulating_supply'] = this.circulating_supply;
    data['fdv_to_tvl_ratio'] = this.fdv_to_tvl_ratio;
    data['last_updated'] = this.last_updated;
    data['market_cap_change_24h'] = this.market_cap_change_24h;
    data['market_cap_change_percentage_24h'] = this.market_cap_change_percentage_24h;
    data['market_cap_rank'] = this.market_cap_rank;
    data['max_supply'] = this.max_supply;
    data['mcap_to_tvl_ratio'] = this.mcap_to_tvl_ratio;
    data['price_change_24h'] = this.price_change_24h;
    data['price_change_percentage_14d'] = this.price_change_percentage_14d;
    data['price_change_percentage_1y'] = this.price_change_percentage_1y;
    data['price_change_percentage_200d'] = this.price_change_percentage_200d;
    data['price_change_percentage_24h'] = this.price_change_percentage_24h;
    data['price_change_percentage_30d'] = this.price_change_percentage_30d;
    data['price_change_percentage_60d'] = this.price_change_percentage_60d;
    data['price_change_percentage_7d'] = this.price_change_percentage_7d;
    data['roi'] = this.roi;
    data['total_supply'] = this.total_supply;
    data['total_value_locked'] = this.total_value_locked;
    if (this.ath != null) {
      data['ath'] = this.ath!.toJson();
    }
    if (this.ath_change_percentage != null) {
      data['ath_change_percentage'] = this.ath_change_percentage!.toJson();
    }
    if (this.ath_date != null) {
      data['ath_date'] = this.ath_date!.toJson();
    }
    if (this.atl != null) {
      data['atl'] = this.atl!.toJson();
    }
    if (this.atl_change_percentage != null) {
      data['atl_change_percentage'] = this.atl_change_percentage!.toJson();
    }
    if (this.atl_date != null) {
      data['atl_date'] = this.atl_date!.toJson();
    }
    if (this.current_price != null) {
      data['current_price'] = this.current_price!.toJson();
    }
    if (this.fully_diluted_valuation != null) {
      data['fully_diluted_valuation'] = this.fully_diluted_valuation!.toJson();
    }
    if (this.high_24h != null) {
      data['high_24h'] = this.high_24h!.toJson();
    }
    if (this.low_24h != null) {
      data['low_24h'] = this.low_24h!.toJson();
    }
    if (this.market_cap != null) {
      data['market_cap'] = this.market_cap!.toJson();
    }
    if (this.market_cap_change_24h_in_currency != null) {
      data['market_cap_change_24h_in_currency'] = this.market_cap_change_24h_in_currency!.toJson();
    }
    if (this.market_cap_change_percentage_24h_in_currency != null) {
      data['market_cap_change_percentage_24h_in_currency'] = this.market_cap_change_percentage_24h_in_currency!.toJson();
    }
    if (this.price_change_24h_in_currency != null) {
      data['price_change_24h_in_currency'] = this.price_change_24h_in_currency!.toJson();
    }
    if (this.price_change_percentage_14d_in_currency != null) {
      data['price_change_percentage_14d_in_currency'] = this.price_change_percentage_14d_in_currency!.toJson();
    }
    if (this.price_change_percentage_1h_in_currency != null) {
      data['price_change_percentage_1h_in_currency'] = this.price_change_percentage_1h_in_currency!.toJson();
    }
    if (this.price_change_percentage_1y_in_currency != null) {
      data['price_change_percentage_1y_in_currency'] = this.price_change_percentage_1y_in_currency!.toJson();
    }
    if (this.price_change_percentage_200d_in_currency != null) {
      data['price_change_percentage_200d_in_currency'] = this.price_change_percentage_200d_in_currency!.toJson();
    }
    if (this.price_change_percentage_24h_in_currency != null) {
      data['price_change_percentage_24h_in_currency'] = this.price_change_percentage_24h_in_currency!.toJson();
    }
    if (this.price_change_percentage_30d_in_currency != null) {
      data['price_change_percentage_30d_in_currency'] = this.price_change_percentage_30d_in_currency!.toJson();
    }
    if (this.price_change_percentage_60d_in_currency != null) {
      data['price_change_percentage_60d_in_currency'] = this.price_change_percentage_60d_in_currency!.toJson();
    }
    if (this.price_change_percentage_7d_in_currency != null) {
      data['price_change_percentage_7d_in_currency'] = this.price_change_percentage_7d_in_currency!.toJson();
    }
    if (this.sparkline_7d != null) {
      data['sparkline_7d'] = this.sparkline_7d!.toJson();
    }
    if (this.total_volume != null) {
      data['total_volume'] = this.total_volume!.toJson();
    }
    return data;
  }
}

class AtlDate {
  String? trys;
  String? aed;
  String? ars;
  String? aud;
  String? bch;
  String? bdt;
  String? bhd;
  String? bits;
  String? bmd;
  String? bnb;
  String? brl;
  String? btc;
  String? cad;
  String? chf;
  String? clp;
  String? cny;
  String? czk;
  String? dkk;
  String? dot;
  String? eos;
  String? eth;
  String? eur;
  String? gbp;
  String? hkd;
  String? huf;
  String? idr;
  String? ils;
  String? inr;
  String? jpy;
  String? krw;
  String? kwd;
  String? link;
  String? lkr;
  String? ltc;
  String? mmk;
  String? mxn;
  String? myr;
  String? ngn;
  String? nok;
  String? nzd;
  String? php;
  String? pkr;
  String? pln;
  String? rub;
  String? sar;
  String? sats;
  String? sek;
  String? sgd;
  String? thb;
  String? twd;
  String? uah;
  String? usd;
  String? vef;
  String? vnd;
  String? xag;
  String? xau;
  String? xdr;
  String? xlm;
  String? xrp;
  String? yfi;
  String? zar;

  AtlDate(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory AtlDate.fromJson(Map<String, dynamic> json) {
    return AtlDate(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class Low24h {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  Low24h(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory Low24h.fromJson(Map<String, dynamic> json) {
    return Low24h(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChangePercentage60dInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  PriceChangePercentage60dInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory PriceChangePercentage60dInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChangePercentage60dInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChangePercentage200dInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  PriceChangePercentage200dInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory PriceChangePercentage200dInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChangePercentage200dInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChangePercentage1yInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? zar;

  PriceChangePercentage1yInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.zar});

  factory PriceChangePercentage1yInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChangePercentage1yInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['zar'] = this.zar;
    return data;
  }
}

class AthDate {
  String? trys;
  String? aed;
  String? ars;
  String? aud;
  String? bch;
  String? bdt;
  String? bhd;
  String? bits;
  String? bmd;
  String? bnb;
  String? brl;
  String? btc;
  String? cad;
  String? chf;
  String? clp;
  String? cny;
  String? czk;
  String? dkk;
  String? dot;
  String? eos;
  String? eth;
  String? eur;
  String? gbp;
  String? hkd;
  String? huf;
  String? idr;
  String? ils;
  String? inr;
  String? jpy;
  String? krw;
  String? kwd;
  String? link;
  String? lkr;
  String? ltc;
  String? mmk;
  String? mxn;
  String? myr;
  String? ngn;
  String? nok;
  String? nzd;
  String? php;
  String? pkr;
  String? pln;
  String? rub;
  String? sar;
  String? sats;
  String? sek;
  String? sgd;
  String? thb;
  String? twd;
  String? uah;
  String? usd;
  String? vef;
  String? vnd;
  String? xag;
  String? xau;
  String? xdr;
  String? xlm;
  String? xrp;
  String? yfi;
  String? zar;

  AthDate(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory AthDate.fromJson(Map<String, dynamic> json) {
    return AthDate(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class AtlChangePercentage {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  AtlChangePercentage(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory AtlChangePercentage.fromJson(Map<String, dynamic> json) {
    return AtlChangePercentage(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChange24hInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  PriceChange24hInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory PriceChange24hInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChange24hInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChangePercentage7dInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  PriceChangePercentage7dInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory PriceChangePercentage7dInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChangePercentage7dInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class Ath {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  Ath(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory Ath.fromJson(Map<String, dynamic> json) {
    return Ath(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class High24h {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  High24h(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory High24h.fromJson(Map<String, dynamic> json) {
    return High24h(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class MarketCapChangePercentage24hInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  MarketCapChangePercentage24hInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory MarketCapChangePercentage24hInCurrency.fromJson(Map<String, dynamic> json) {
    return MarketCapChangePercentage24hInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class MarketCapChange24hInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  MarketCapChange24hInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory MarketCapChange24hInCurrency.fromJson(Map<String, dynamic> json) {
    return MarketCapChange24hInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class MarketCap {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  MarketCap(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory MarketCap.fromJson(Map<String, dynamic> json) {
    return MarketCap(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class Atl {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  Atl(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory Atl.fromJson(Map<String, dynamic> json) {
    return Atl(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class AthChangePercentage {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  AthChangePercentage(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory AthChangePercentage.fromJson(Map<String, dynamic> json) {
    return AthChangePercentage(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class Sparkline7d {
  List<double>? price;

  Sparkline7d({this.price});

  factory Sparkline7d.fromJson(Map<String, dynamic> json) {
    return Sparkline7d(
      price: json['price'] != null ? new List<double>.from(json['price']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price;
    }
    return data;
  }
}

class TotalVolume {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  TotalVolume(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory TotalVolume.fromJson(Map<String, dynamic> json) {
    return TotalVolume(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class CurrentPrice {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  CurrentPrice(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class PriceChangePercentage1hInCurrency {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  PriceChangePercentage1hInCurrency(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory PriceChangePercentage1hInCurrency.fromJson(Map<String, dynamic> json) {
    return PriceChangePercentage1hInCurrency(
      trys: json['try'],
      aed: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class FullyDilutedValuation {
  num? trys;
  num? aed;
  num? ars;
  num? aud;
  num? bch;
  num? bdt;
  num? bhd;
  num? bits;
  num? bmd;
  num? bnb;
  num? brl;
  num? btc;
  num? cad;
  num? chf;
  num? clp;
  num? cny;
  num? czk;
  num? dkk;
  num? dot;
  num? eos;
  num? eth;
  num? eur;
  num? gbp;
  num? hkd;
  num? huf;
  num? idr;
  num? ils;
  num? inr;
  num? jpy;
  num? krw;
  num? kwd;
  num? link;
  num? lkr;
  num? ltc;
  num? mmk;
  num? mxn;
  num? myr;
  num? ngn;
  num? nok;
  num? nzd;
  num? php;
  num? pkr;
  num? pln;
  num? rub;
  num? sar;
  num? sats;
  num? sek;
  num? sgd;
  num? thb;
  num? twd;
  num? uah;
  num? usd;
  num? vef;
  num? vnd;
  num? xag;
  num? xau;
  num? xdr;
  num? xlm;
  num? xrp;
  num? yfi;
  num? zar;

  FullyDilutedValuation(
      {this.trys,
      this.aed,
      this.ars,
      this.aud,
      this.bch,
      this.bdt,
      this.bhd,
      this.bits,
      this.bmd,
      this.bnb,
      this.brl,
      this.btc,
      this.cad,
      this.chf,
      this.clp,
      this.cny,
      this.czk,
      this.dkk,
      this.dot,
      this.eos,
      this.eth,
      this.eur,
      this.gbp,
      this.hkd,
      this.huf,
      this.idr,
      this.ils,
      this.inr,
      this.jpy,
      this.krw,
      this.kwd,
      this.link,
      this.lkr,
      this.ltc,
      this.mmk,
      this.mxn,
      this.myr,
      this.ngn,
      this.nok,
      this.nzd,
      this.php,
      this.pkr,
      this.pln,
      this.rub,
      this.sar,
      this.sats,
      this.sek,
      this.sgd,
      this.thb,
      this.twd,
      this.uah,
      this.usd,
      this.vef,
      this.vnd,
      this.xag,
      this.xau,
      this.xdr,
      this.xlm,
      this.xrp,
      this.yfi,
      this.zar});

  factory FullyDilutedValuation.fromJson(Map<String, dynamic> json) {
    return FullyDilutedValuation(
      trys: json['aed'],
      ars: json['ars'],
      aud: json['aud'],
      bch: json['bch'],
      bdt: json['bdt'],
      bhd: json['bhd'],
      bits: json['bits'],
      bmd: json['bmd'],
      bnb: json['bnb'],
      brl: json['brl'],
      btc: json['btc'],
      cad: json['cad'],
      chf: json['chf'],
      clp: json['clp'],
      cny: json['cny'],
      czk: json['czk'],
      dkk: json['dkk'],
      dot: json['dot'],
      eos: json['eos'],
      eth: json['eth'],
      eur: json['eur'],
      gbp: json['gbp'],
      hkd: json['hkd'],
      huf: json['huf'],
      idr: json['idr'],
      ils: json['ils'],
      inr: json['inr'],
      jpy: json['jpy'],
      krw: json['krw'],
      kwd: json['kwd'],
      link: json['link'],
      lkr: json['lkr'],
      ltc: json['ltc'],
      mmk: json['mmk'],
      mxn: json['mxn'],
      myr: json['myr'],
      ngn: json['ngn'],
      nok: json['nok'],
      nzd: json['nzd'],
      php: json['php'],
      pkr: json['pkr'],
      pln: json['pln'],
      rub: json['rub'],
      sar: json['sar'],
      sats: json['sats'],
      sek: json['sek'],
      sgd: json['sgd'],
      thb: json['thb'],
      twd: json['twd'],
      uah: json['uah'],
      usd: json['usd'],
      vef: json['vef'],
      vnd: json['vnd'],
      xag: json['xag'],
      xau: json['xau'],
      xdr: json['xdr'],
      xlm: json['xlm'],
      xrp: json['xrp'],
      yfi: json['yfi'],
      zar: json['zar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['try'] = this.trys;
    data['aed'] = this.aed;
    data['ars'] = this.ars;
    data['aud'] = this.aud;
    data['bch'] = this.bch;
    data['bdt'] = this.bdt;
    data['bhd'] = this.bhd;
    data['bits'] = this.bits;
    data['bmd'] = this.bmd;
    data['bnb'] = this.bnb;
    data['brl'] = this.brl;
    data['btc'] = this.btc;
    data['cad'] = this.cad;
    data['chf'] = this.chf;
    data['clp'] = this.clp;
    data['cny'] = this.cny;
    data['czk'] = this.czk;
    data['dkk'] = this.dkk;
    data['dot'] = this.dot;
    data['eos'] = this.eos;
    data['eth'] = this.eth;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    data['hkd'] = this.hkd;
    data['huf'] = this.huf;
    data['idr'] = this.idr;
    data['ils'] = this.ils;
    data['inr'] = this.inr;
    data['jpy'] = this.jpy;
    data['krw'] = this.krw;
    data['kwd'] = this.kwd;
    data['link'] = this.link;
    data['lkr'] = this.lkr;
    data['ltc'] = this.ltc;
    data['mmk'] = this.mmk;
    data['mxn'] = this.mxn;
    data['myr'] = this.myr;
    data['ngn'] = this.ngn;
    data['nok'] = this.nok;
    data['nzd'] = this.nzd;
    data['php'] = this.php;
    data['pkr'] = this.pkr;
    data['pln'] = this.pln;
    data['rub'] = this.rub;
    data['sar'] = this.sar;
    data['sats'] = this.sats;
    data['sek'] = this.sek;
    data['sgd'] = this.sgd;
    data['thb'] = this.thb;
    data['twd'] = this.twd;
    data['uah'] = this.uah;
    data['usd'] = this.usd;
    data['vef'] = this.vef;
    data['vnd'] = this.vnd;
    data['xag'] = this.xag;
    data['xau'] = this.xau;
    data['xdr'] = this.xdr;
    data['xlm'] = this.xlm;
    data['xrp'] = this.xrp;
    data['yfi'] = this.yfi;
    data['zar'] = this.zar;
    return data;
  }
}

class Localization {
  var it;
  var ar;
  var de;
  var en;
  var es;
  var fr;
  var hu;
  var id;
  var ja;
  var ko;
  var nl;
  var pl;
  var pt;
  var ro;
  var ru;
  var sv;
  var th;
  var tr;
  var vi;
  var zh;
  var zh_tw;

  Localization({
    this.it,
    this.ar,
    this.de,
    this.en,
    this.es,
    this.fr,
    this.hu,
    this.id,
    this.ja,
    this.ko,
    this.nl,
    this.pl,
    this.pt,
    this.ro,
    this.ru,
    this.sv,
    this.th,
    this.tr,
    this.vi,
    this.zh,
    this.zh_tw,
  });

  factory Localization.fromJson(Map<String, dynamic> json) {
    return Localization(
      it: json['`it`'],
      ar: json['ar'],
      de: json['de'],
      en: json['en'],
      es: json['es'],
      fr: json['fr'],
      hu: json['hu'],
      id: json['id'],
      ja: json['ja'],
      ko: json['ko'],
      nl: json['nl'],
      pl: json['pl'],
      pt: json['pt'],
      ro: json['ro'],
      ru: json['ru'],
      sv: json['sv'],
      th: json['th'],
      tr: json['tr'],
      vi: json['vi'],
      zh: json['zh'],
      zh_tw: json['zh-tw'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['it'] = this.it;
    data['ar'] = this.ar;
    data['de'] = this.de;
    data['en'] = this.en;
    data['es'] = this.es;
    data['fr'] = this.fr;
    data['hu'] = this.hu;
    data['id'] = this.id;
    data['ja'] = this.ja;
    data['ko'] = this.ko;
    data['nl'] = this.nl;
    data['pl'] = this.pl;
    data['pt'] = this.pt;
    data['ro'] = this.ro;
    data['ru'] = this.ru;
    data['sv'] = this.sv;
    data['th'] = this.th;
    data['tr'] = this.tr;
    data['vi'] = this.vi;
    data['zh'] = this.zh;
    data['zh-tw'] = this.zh_tw;
    return data;
  }
}

class Images {
  String? large;
  String? small;
  String? thumb;

  Images({this.large, this.small, this.thumb});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
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

class DeveloperData {
  num? closed_issues;
  CodeAdditionsDeletions4Weeks? code_additions_deletions_4_weeks;
  num? commit_count_4_weeks;
  num? forks;
  List<num>? last_4_weeks_commit_activity_series;
  num? pull_request_contributors;
  num? pull_requests_merged;
  num? stars;
  num? subscribers;
  num? total_issues;

  DeveloperData(
      {this.closed_issues,
      this.code_additions_deletions_4_weeks,
      this.commit_count_4_weeks,
      this.forks,
      this.last_4_weeks_commit_activity_series,
      this.pull_request_contributors,
      this.pull_requests_merged,
      this.stars,
      this.subscribers,
      this.total_issues});

  factory DeveloperData.fromJson(Map<String, dynamic> json) {
    return DeveloperData(
      closed_issues: json['closed_issues'],
      code_additions_deletions_4_weeks: json['code_additions_deletions_4_weeks'] != null ? CodeAdditionsDeletions4Weeks.fromJson(json['code_additions_deletions_4_weeks']) : null,
      commit_count_4_weeks: json['commit_count_4_weeks'],
      forks: json['forks'],
      last_4_weeks_commit_activity_series: json['last_4_weeks_commit_activity_series'] != null ? new List<num>.from(json['last_4_weeks_commit_activity_series']) : null,
      pull_request_contributors: json['pull_request_contributors'],
      pull_requests_merged: json['pull_requests_merged'],
      stars: json['stars'],
      subscribers: json['subscribers'],
      total_issues: json['total_issues'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['closed_issues'] = this.closed_issues;
    data['commit_count_4_weeks'] = this.commit_count_4_weeks;
    data['forks'] = this.forks;
    data['pull_request_contributors'] = this.pull_request_contributors;
    data['pull_requests_merged'] = this.pull_requests_merged;
    data['stars'] = this.stars;
    data['subscribers'] = this.subscribers;
    data['total_issues'] = this.total_issues;
    if (this.code_additions_deletions_4_weeks != null) {
      data['code_additions_deletions_4_weeks'] = this.code_additions_deletions_4_weeks!.toJson();
    }
    if (this.last_4_weeks_commit_activity_series != null) {
      data['last_4_weeks_commit_activity_series'] = this.last_4_weeks_commit_activity_series;
    }
    return data;
  }
}

class CodeAdditionsDeletions4Weeks {
  num? additions;
  num? deletions;

  CodeAdditionsDeletions4Weeks({this.additions, this.deletions});

  factory CodeAdditionsDeletions4Weeks.fromJson(Map<String, dynamic> json) {
    return CodeAdditionsDeletions4Weeks(
      additions: json['additions'],
      deletions: json['deletions'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additions'] = this.additions;
    data['deletions'] = this.deletions;
    return data;
  }
}

class Platforms {
  var string;

  Platforms({this.string});

  factory Platforms.fromJson(Map<String, dynamic> json) {
    return Platforms(
      string: json['String'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['String'] = this.string;
    return data;
  }
}

class CommunityData {
  var facebook_likes;
  num? reddit_accounts_active_48h;
  num? reddit_average_comments_48h;
  num? reddit_average_posts_48h;
  num? reddit_subscribers;
  var telegram_channel_user_count;
  num? twitter_followers;

  CommunityData(
      {this.facebook_likes,
      this.reddit_accounts_active_48h,
      this.reddit_average_comments_48h,
      this.reddit_average_posts_48h,
      this.reddit_subscribers,
      this.telegram_channel_user_count,
      this.twitter_followers});

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    return CommunityData(
      facebook_likes: json['facebook_likes'],
      reddit_accounts_active_48h: json['reddit_accounts_active_48h'],
      reddit_average_comments_48h: json['reddit_average_comments_48h'],
      reddit_average_posts_48h: json['reddit_average_posts_48h'],
      reddit_subscribers: json['reddit_subscribers'],
      telegram_channel_user_count: json['telegram_channel_user_count'],
      twitter_followers: json['twitter_followers'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook_likes'] = this.facebook_likes;
    data['reddit_accounts_active_48h'] = this.reddit_accounts_active_48h;
    data['reddit_average_comments_48h'] = this.reddit_average_comments_48h;
    data['reddit_average_posts_48h'] = this.reddit_average_posts_48h;
    data['reddit_subscribers'] = this.reddit_subscribers;
    data['telegram_channel_user_count'] = this.telegram_channel_user_count;
    data['twitter_followers'] = this.twitter_followers;
    return data;
  }
}

class Ticker {
  String? base;
  num? bid_ask_spread_percentage;
  var coin_id;
  ConvertedLast? converted_last;
  ConvertedLast? converted_volume;
  bool? is_anomaly;
  bool? is_stale;
  num? last;
  var last_fetch_at;
  var last_traded_at;
  Market? market;
  String? target;
  var target_coin_id;
  var timestamp;
  var token_info_url;
  String? trade_url;
  String? trust_score;
  num? volume;

  Ticker(
      {this.base,
      this.bid_ask_spread_percentage,
      this.coin_id,
      this.converted_last,
      this.converted_volume,
      this.is_anomaly,
      this.is_stale,
      this.last,
      this.last_fetch_at,
      this.last_traded_at,
      this.market,
      this.target,
      this.target_coin_id,
      this.timestamp,
      this.token_info_url,
      this.trade_url,
      this.trust_score,
      this.volume});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      base: json['base'],
      bid_ask_spread_percentage: json['bid_ask_spread_percentage'],
      coin_id: json['coin_id'],
      converted_last: json['converted_last'] != null ? ConvertedLast.fromJson(json['converted_last']) : null,
      converted_volume: json['converted_volume'] != null ? ConvertedLast.fromJson(json['converted_volume']) : null,
      is_anomaly: json['is_anomaly'],
      is_stale: json['is_stale'],
      last: json['last'],
      last_fetch_at: json['last_fetch_at'],
      last_traded_at: json['last_traded_at'],
      market: json['market'] != null ? Market.fromJson(json['market']) : null,
      target: json['target'],
      target_coin_id: json['target_coin_id'],
      timestamp: json['timestamp'],
      token_info_url: json['token_info_url'],
      trade_url: json['trade_url'],
      trust_score: json['trust_score'],
      volume: json['volume'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['bid_ask_spread_percentage'] = this.bid_ask_spread_percentage;
    data['coin_id'] = this.coin_id;
    data['is_anomaly'] = this.is_anomaly;
    data['is_stale'] = this.is_stale;
    data['last'] = this.last;
    data['last_fetch_at'] = this.last_fetch_at;
    data['last_traded_at'] = this.last_traded_at;
    data['target'] = this.target;
    data['target_coin_id'] = this.target_coin_id;
    data['timestamp'] = this.timestamp;
    data['token_info_url'] = this.token_info_url;
    data['trade_url'] = this.trade_url;
    data['trust_score'] = this.trust_score;
    data['volume'] = this.volume;
    if (this.converted_last != null) {
      data['converted_last'] = this.converted_last!.toJson();
    }
    if (this.converted_volume != null) {
      data['converted_volume'] = this.converted_volume!.toJson();
    }
    if (this.market != null) {
      data['market'] = this.market!.toJson();
    }
    return data;
  }
}

class Market {
  bool? has_trading_incentive;
  String? identifier;
  String? name;

  Market({this.has_trading_incentive, this.identifier, this.name});

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      has_trading_incentive: json['has_trading_incentive'],
      identifier: json['identifier'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_trading_incentive'] = this.has_trading_incentive;
    data['identifier'] = this.identifier;
    data['name'] = this.name;
    return data;
  }
}

class ConvertedLast {
  num? btc;
  num? eth;
  num? usd;

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

class ConvertedVolume {
  num? btc;
  num? eth;
  num? usd;

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
