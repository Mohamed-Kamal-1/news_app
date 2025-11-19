import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/presentation/newslist_details_screen/cubit/news_list_state.dart';

import '../../domain/model/source/source.dart';
import 'ArticlesListWidget.dart';
import 'cubit/news_list_viewModel.dart';

class NewsListView extends StatefulWidget {
  final Source source;

  const NewsListView({required this.source, Key? key}) : super(key: key);

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsListViewModel viewModel = getIt.get<NewsListViewModel>();

  @override
  void initState() {
    super.initState();
    print(widget.source.id);
    viewModel.getArticle(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder(
        builder: (context, state) {
          if (state is NewsErrorState) {
            return Center(
              child: Text(state.errorMessage ?? "Something went wrong"),
            );
          } else if (state is NewsSuccessState) {
            return ArticlesListWidget(state.articleList ?? []);
          } else if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
