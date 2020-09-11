import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class NewsList {
  final List<News> articles;

  NewsList({this.articles});

  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}

@JsonSerializable()
class News extends Equatable {
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'urlToImage')
  final String urlToImage;
  @JsonKey(name: 'publishedAt')
  final String publishedAt;

  News({this.title, this.url, this.urlToImage, this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  // Equatable
  @override
  List<Object> get props => [title, url, urlToImage];

  @override
  String toString() => 'News { title: $title }';
}
