import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/color/app_color.dart';
import 'package:news_app/domain/model/article/article.dart';

class FullViewArticle extends StatelessWidget {
  final Article article;

  const FullViewArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton( onPressed: () => Navigator.pop(context) ,icon:Icon(Icons.arrow_back_ios)),
        title: Text("abcNEWS"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.description!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: AppColor.black,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              article.title!,
              style: TextStyle(fontSize: 16, color: AppColor.black),
            ),

            const SizedBox(height: 12),
            Row(
              spacing: 5,
              children: [
                Text('By',style: TextStyle(color: AppColor.grey),),
                Column(
                  children: [
                    Text(
                      article.author!,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(color: AppColor.blue,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(width: 10),
            Text(
              article.publishedAt!,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: article.urlToImage!),
            ),

            const SizedBox(height: 16),

            Text(
              article.description!,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: AppColor.black,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              article.content!,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
