import 'package:flutter/material.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/news_card.dart';


import '../../domain/model/article/article.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;
  //handel form viewModel
  ArticlesListWidget(this.articles,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var article = articles[index];
        return NewsCard(articleModel: article);
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: articles.length,
    );
  }
}
