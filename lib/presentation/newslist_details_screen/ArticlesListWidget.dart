import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/color/app_color.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/model_sheet_widget.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/news_card.dart';

import '../../domain/model/article/article.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;

  ArticlesListWidget(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ModelSheetWidget(article: articles[index],);
              },
            );
          },
          child: NewsCard(articleModel: article),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: articles.length,
    );
  }
}
