import 'package:flutter/material.dart';

import '../../../domain/model/category/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.model, required this.index});

  final CategoryModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(model.image ?? ''),
        ),
        Positioned(
          top: 24,
          right: index.isEven ? 24 : null,
          left: index.isOdd ? 24 : null,
          child: Text(
            model.title ?? "",
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Positioned(
          bottom: 10,
          right: index.isEven ? 10 : null,
          left: index.isOdd ? 10 : null,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Colors.black.withAlpha(124),
            ),
            child: Text('View All ', style: TextStyle(fontSize: 25)),
          ),
        ),
      ],
    );
  }
}
