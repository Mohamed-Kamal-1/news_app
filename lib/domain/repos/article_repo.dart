
import 'package:flutter/cupertino.dart';
import 'package:news_app/domain/model/article/article_response_model.dart';

abstract interface class ArticleRepo {
  Future<ArticleResponseModel> getArticle(String sourceId);

}
