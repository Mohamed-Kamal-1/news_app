import 'package:flutter/material.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_view_model.dart';
import 'package:news_app/presentation/home/widgets/custom_scaffold.dart';
import 'package:news_app/presentation/home/widgets/search_widget.dart';

import '../../domain/model/category/category_model.dart';
import '../category_details/category_details_view.dart';
import '../category_screen/category_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;
  late HomeViewModel? homeViewModel;

  @override
  void initState() {
    super.initState();
    homeViewModel = getIt.get<HomeViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onHomeClick,
      title: categoryModel == null ? 'Home' : categoryModel?.title ?? "",
      actions: categoryModel == null
          ? null
          : [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchWidget(homeViewModel: homeViewModel!),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
      body: categoryModel == null
          ? CategoryView(onCategoryClick)
          : CategoryDetailsView(categoryModel!),
    );
  }

  void onCategoryClick(CategoryModel category) {
    setState(() {
      categoryModel = category;
    });
  }

  void onHomeClick() {
    setState(() {
      categoryModel = null;
    });
  }
}
