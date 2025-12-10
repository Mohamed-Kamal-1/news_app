import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/model/article/article_response_model.dart';
import 'package:news_app/domain/repos/article_repo.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_state.dart';

import '../../../../domain/model/article/article.dart';

@singleton
class HomeViewModel extends Cubit<HomeState> {
  ArticleRepo articleRepo;
  int _currentPage = 1;
  final int _pageSize = 10;
  bool _hasMore = true;
  bool _isFeatching = false;
  final List<Article> _allArticle = [];

  HomeViewModel(this.articleRepo) : super(HomeSearchInitialState());

  Future<void> searchForArticles(String searchKeyWord) async {
    if (!_hasMore || _isFeatching) return;
    _isFeatching = true;
      emit(HomeSearchLoadingStat());
    try {
      ArticleResponseModel responseModel = await articleRepo
          .getArticlesResponseForSearch(searchKeyWord, _pageSize, _currentPage);

      if (responseModel.status == "error") {
        emit(HomeSearchErrorState(message: responseModel.message));
        _hasMore = false;
        return;
      }

      if (responseModel.status == "ok") {
        _allArticle.addAll(responseModel.articles ?? []);
        emit(HomeSearchSuccessState(articles: List.from(_allArticle)));
        _currentPage++;
      }
    } catch (e) {
      emit(HomeSearchErrorState(message: e.toString()));
    }
    _isFeatching = false;
  }
}
