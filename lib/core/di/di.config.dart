// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_manger.dart' as _i254;
import '../../api/data_source_impl/data_source_impl.dart' as _i1062;
import '../../data/data_source/online_data_source.dart' as _i735;
import '../../data/repo_impl/article_repo_impl.dart' as _i237;
import '../../data/repo_impl/sources_repo_impl.dart' as _i564;
import '../../domain/repos/article_repo.dart' as _i234;
import '../../domain/repos/sources_repo.dart' as _i675;
import '../../presentation/category_details/cubit/category_view_model.dart'
    as _i991;
import '../../presentation/home/home_view_model.dart' as _i988;
import '../../presentation/newslist_details_screen/cubit/news_list_viewModel.dart'
    as _i755;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i254.ApiManger>(() => _i254.ApiManger());
    gh.factory<_i735.OnlineDataSource>(
      () => _i1062.DataSourceImpl(gh<_i254.ApiManger>()),
    );
    gh.factory<_i234.ArticleRepo>(
      () => _i237.ArticleRepoImpl(gh<_i735.OnlineDataSource>()),
    );
    gh.factory<_i988.HomeViewModel>(
      () => _i988.HomeViewModel(gh<_i234.ArticleRepo>(), gh<String>()),
    );
    gh.factory<_i755.NewsListViewModel>(
      () => _i755.NewsListViewModel(gh<_i234.ArticleRepo>()),
    );
    gh.factory<_i675.SourcesRepo>(
      () => _i564.SourcesRepoImpl(gh<_i735.OnlineDataSource>()),
    );
    gh.factory<_i991.CategoryViewModel>(
      () => _i991.CategoryViewModel(gh<_i675.SourcesRepo>()),
    );
    return this;
  }
}
