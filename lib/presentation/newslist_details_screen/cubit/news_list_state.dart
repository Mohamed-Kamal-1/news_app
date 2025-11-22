import 'package:news_app/domain/model/article/article.dart';

abstract class NewsState {
}
class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String? errorMessage;

  NewsErrorState({this.errorMessage});
}

class NewsSuccessState extends NewsState {
  List<Article>? articleList;

  NewsSuccessState({this.articleList});
}

