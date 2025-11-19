import 'package:injectable/injectable.dart';
import 'package:news_app/domain/repos/article_repo.dart';


@injectable
class HomeViewModel {
  ArticleRepo articleRepo;
  String sourceId;
  HomeViewModel(this.articleRepo,this.sourceId);

  void getArticle(String sourceId) async {
    await articleRepo.getArticle(sourceId);
  }

  // void
  //  SourcesRepo? sourcesRepo;
}
