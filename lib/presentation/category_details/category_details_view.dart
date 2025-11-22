import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/di.dart';
import '../../domain/model/category/category_model.dart';
import 'NewsSources.dart';
import 'cubit/category_states.dart';
import 'cubit/category_view_model.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryModel category;

  const CategoryDetailsView(this.category, {super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  CategoryViewModel viewModel = getIt.get<CategoryViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<CategoryViewModel, CategoryStates>(
        builder: (context, state) {
          if (state is CategoryErrorState) {
            return Center(
              child: Text(state.errorMessage ?? 'something went wrong'),
            );
          } else if (state is CategorySuccessState) {
            return NewsSourcesWidget(state.sourcesList ?? const []);
          } else if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
