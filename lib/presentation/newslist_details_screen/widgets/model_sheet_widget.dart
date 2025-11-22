import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/newslist_details_screen/widgets/full_view_article.dart';

import '../../../core/color/app_color.dart';
import '../../../domain/model/article/article.dart';

class ModelSheetWidget extends StatelessWidget {
  final Article article;

  const ModelSheetWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Text(
            article.description!,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FullViewArticle(article: article);
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            child: Text(
              "View Full Articel",
              style: TextStyle(color: AppColor.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
