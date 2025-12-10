import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/presentation/newslist_details_screen/cubit/news_list_state.dart';
import 'ArticlesListWidget.dart';
import 'cubit/news_list_viewModel.dart';

class NewsListView extends StatefulWidget {
  final String? sourceId;
  final NewsListViewModel viewModel;

  const NewsListView({
    required this.sourceId,
    super.key,
    required this.viewModel,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getArticle(widget.sourceId!);
  }

  @override
  void didUpdateWidget(NewsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      widget.viewModel.getArticle(widget.sourceId ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListViewModel, NewsState>(
      bloc: widget.viewModel,
      builder: (context, state) {
        if (state is NewsErrorState) {
          return Center(
            child: Text(state.errorMessage ?? "Something went wrong"),
          );
        } else if (state is NewsSuccessState) {
          return ArticlesListWidget(articles: state.articleList ?? [],sourceId: widget.sourceId,);
        } else if (state is NewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(color: Colors.red);
      },
    );
  }
}
