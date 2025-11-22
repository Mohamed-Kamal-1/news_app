import 'package:news_app/domain/model/article/article_response_model.dart';
import 'package:news_app/domain/model/source/source_response_model.dart';
abstract interface class OnlineDataSource {
  Future<SourceResponseModel> getSourceResponse(String categoryId);

  Future<ArticleResponseModel> getArticlesResponse(String sourceId);
  Future<ArticleResponseModel> getArticlesResponseForSearch(String searchKeyWord);


}
