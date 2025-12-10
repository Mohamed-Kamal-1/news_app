import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/data/data_source/online_data_source.dart';
import 'package:news_app/domain/model/article/article_response_model.dart';
import '../../domain/model/source/source_response_model.dart';

@Injectable(as: OnlineDataSource)
class DataSourceImpl implements OnlineDataSource {
  ApiManger apiManger;

  DataSourceImpl(this.apiManger);

  @override
  Future<SourceResponseModel> getSourceResponse(String categoryId) async {
    var response = await apiManger.getNewsSources(categoryId);
    return response.getResponse();
  }

  @override
  Future<ArticleResponseModel> getArticlesResponse(String sourceId) async {
    var response = await apiManger.getArticles(sourceId);
    return response.getArticleResponse();
  }

  @override
  Future<ArticleResponseModel> getArticlesResponseForSearch(
    String searchKeyWord,
    int? page,
    int? pageSize,
  ) async {
    var response = await apiManger.searchForArticles(
      searchKeyWord,
      pageSize: pageSize ?? 10,
      page: page ?? 1,
    );
    return response.getArticleResponse();
  }

  // @override
  // Future<List<Article>> getArticle(String sourceId) async {
  //   var response = await ApiManger.getArticles(sourceId);
  //   return response.articles?.map((articlesDto) => articlesDto.toArticle()).toList() ?? [];
  //
  // }
}
