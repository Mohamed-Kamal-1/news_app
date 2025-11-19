import '../model/source/source_response_model.dart';

abstract interface class SourcesRepo{
  Future<SourceResponseModel> getSourceResponse(String categoryId);

}