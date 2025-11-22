import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/repos/article_repo.dart';
import 'package:news_app/presentation/newslist_details_screen/cubit/news_list_state.dart';

@injectable
class NewsListViewModel extends Cubit<NewsState> {
  ArticleRepo articleRepo;

  NewsListViewModel(this.articleRepo) : super(NewsInitialState());

  // int ChangeSeletedIndex(){
  //
  // }

  Future<void> getArticle(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await articleRepo.getArticle(sourceId);

      if (response.status == 'ok') {
        emit(NewsSuccessState(articleList: response.articles));
      }
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }

  }
}
