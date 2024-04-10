import 'package:nb_utils/nb_utils.dart';

class NewsResponse {
  List<NewsData>? news;
  int? count;
  int? page;

  NewsResponse({this.news, this.count, this.page});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      news: json['data'] != null ? (json['data'] as List).map((i) => NewsData.fromJson(i)).toList() : null,
      count: json['count'],
      page: json['page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['page'] = this.page;
    if (this.news != null) {
      data['data'] = this.news.validate().map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsData {
  String? author;
  String? description;
  String? news_site;
  String? thumb_2x;
  String? title;
  int? updated_at;
  String? url;

  NewsData({this.author, this.description, this.news_site, this.thumb_2x, this.title, this.updated_at, this.url});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      author: json['author'],
      description: json['description'],
      news_site: json['news_site'],
      thumb_2x: json['thumb_2x'],
      title: json['title'],
      updated_at: json['updated_at'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['description'] = this.description;
    data['news_site'] = this.news_site;
    data['thumb_2x'] = this.thumb_2x;
    data['title'] = this.title;
    data['updated_at'] = this.updated_at;
    data['url'] = this.url;
    return data;
  }
}
