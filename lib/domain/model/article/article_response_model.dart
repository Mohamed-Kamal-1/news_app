import 'package:news_app/domain/model/article/article.dart';

class ArticleResponseModel {
  String? status;
  num? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  ArticleResponseModel({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });
}
