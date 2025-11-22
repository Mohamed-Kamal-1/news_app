import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/model/article/article_response_model.dart';
import 'package:news_app/domain/repos/article_repo.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_state.dart';

@singleton
class HomeViewModel extends Cubit<HomeState> {
  ArticleRepo articleRepo;

  HomeViewModel(this.articleRepo) : super(HomeSearchInitialState());

  Future<void> searchForArticles(String searchKeyWord) async {
    try {
      emit(HomeSearchLoadingStat());
      ArticleResponseModel responseModel = await articleRepo
          .getArticlesResponseForSearch(searchKeyWord);

      if (responseModel.status == "error") {
        emit(HomeSearchErrorState(message: responseModel.message));
        return;
      }

      if (responseModel.status == "ok") {
        emit(HomeSearchSuccessState(articles: responseModel.articles));
      }
    } catch (e) {
      emit(HomeSearchErrorState(message: e.toString()));
    }
  }
}
