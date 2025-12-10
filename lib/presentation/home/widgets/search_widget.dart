import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color/app_color.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_state.dart';
import 'package:news_app/presentation/home/widgets/cubit/home_view_model.dart';
import 'package:news_app/presentation/home/widgets/search_widget_result.dart';

import '../../newslist_details_screen/ArticlesListWidget.dart';

class SearchWidget extends SearchDelegate {
  HomeViewModel homeViewModel;

  SearchWidget({required this.homeViewModel});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: theme.appBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black45,
        contentPadding: EdgeInsets.all(12),
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_outlined, color: AppColor.white),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Icon(Icons.search, color: AppColor.white);
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchWidgetResult(homeViewModel: homeViewModel,searchText: query,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
