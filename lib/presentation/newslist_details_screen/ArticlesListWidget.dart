import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_view_model.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/model_sheet_widget.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/news_card.dart';

import '../../domain/model/article/article.dart';

class ArticlesListWidget extends StatefulWidget {
  final List<Article>? articles;
  final String? sourceId;

  const ArticlesListWidget({this.articles, super.key, this.sourceId});

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var article = widget.articles![index];
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ModelSheetWidget(
                  article: widget.articles![index],
                  sourceId: widget.sourceId,
                );
              },
            );
          },
          child: NewsCard(articleModel: article),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: widget.articles!.length,
    );
  }
}
