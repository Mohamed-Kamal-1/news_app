import 'package:news_app/domain/model/article/article_response_model.dart';

import 'Article_dto.dart';

class ArticleResponseDto {
  ArticleResponseDto({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  ArticleResponseDto.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticleDto.fromJson(v));
      });
    }
  }

  String? status;
  num? totalResults;
  List<ArticleDto>? articles;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ArticleResponseModel getArticleResponse() {
    return ArticleResponseModel(
      status: status,
      totalResults: totalResults,
      articles: articles?.map((articleDto) => articleDto.toArticle()).toList(),
      code: code,
      message: message,
    );
  }
}
