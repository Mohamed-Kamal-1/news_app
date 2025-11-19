import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/model/source/source_response_model.dart';

import '../../../domain/repos/sources_repo.dart';
import 'category_states.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryStates> {
  SourcesRepo sourcesRepo;

  CategoryViewModel(this.sourcesRepo) : super(CategoryInitialState());

  Future<void> getSources(String? categoryId) async {

    try {
      emit(CategoryLoadingState());
      SourceResponseModel response = await sourcesRepo.getSourceResponse(
        categoryId!,
      );
      if (response.status == 'error') {
        emit(CategoryErrorState(errorMessage: response.message!));

        return;
      }
      if (response.status == 'ok') {
        emit(CategorySuccessState(sourcesList: response.sources));
      }
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}
