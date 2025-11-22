import '../../../../domain/model/article/article.dart';

abstract class HomeState {}

class HomeSearchInitialState extends HomeState {}

class HomeSearchLoadingStat extends HomeState {}

class HomeSearchErrorState extends HomeState {
  String? message;

  HomeSearchErrorState({this.message});
}

class HomeSearchSuccessState extends HomeState {
  List<Article>? articles;

  HomeSearchSuccessState({this.articles});
}

class HomeSearchEmptyState extends HomeState {
  String? message;

  HomeSearchEmptyState({this.message});
}
