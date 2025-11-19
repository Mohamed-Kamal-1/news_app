import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/online_data_source.dart';
import 'package:news_app/domain/model/source/source_response_model.dart';

import '../../domain/repos/sources_repo.dart';

@Injectable(as: SourcesRepo)
class SourcesRepoImpl implements SourcesRepo {
  OnlineDataSource onlineDataSource;

  SourcesRepoImpl(this.onlineDataSource);

  @override
  Future<SourceResponseModel> getSourceResponse(String categoryId) async {
    return await onlineDataSource.getSourceResponse(categoryId);
  }
}
