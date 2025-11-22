import 'package:flutter/material.dart';
import 'package:news_app/presentation/category_screen/widgets/category_card.dart';

import '../../domain/model/category/category_model.dart';

typedef OnCategoryClick = void Function(CategoryModel category);

class CategoryView extends StatelessWidget {
  final OnCategoryClick onCategoryClick;

  const CategoryView(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            Text(
              'Good Morning\nHere is Some News For You',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var category = CategoryModel.categories[index];
                  return InkWell(
                    onTap: () {
                      onCategoryClick(category);
                    },
                    child: CategoryCard(model: category, index: index),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: CategoryModel.categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
