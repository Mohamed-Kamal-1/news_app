import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/online_data_source.dart';
import 'package:news_app/domain/model/article/article_response_model.dart';
import 'package:news_app/domain/repos/article_repo.dart';

@Injectable(as: ArticleRepo)
class ArticleRepoImpl implements ArticleRepo {
  OnlineDataSource onlineDataSource;

  ArticleRepoImpl(this.onlineDataSource);

  @override
  Future<ArticleResponseModel> getArticle(String sourceId) {
    return onlineDataSource.getArticlesResponse(sourceId);
  }


}
