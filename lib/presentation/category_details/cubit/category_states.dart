import '../../../domain/model/source/source.dart';

abstract class CategoryStates {}

class CategoryInitialState extends CategoryStates {}

class CategoryLoadingState extends CategoryStates {}

class CategoryErrorState extends CategoryStates {
  String? errorMessage;

  CategoryErrorState({this.errorMessage});
}

class CategorySuccessState extends CategoryStates {
  List<Source>? sourcesList;

  CategorySuccessState({this.sourcesList});
}
