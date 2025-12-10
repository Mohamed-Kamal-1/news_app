import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../newslist_details_screen/widgets/model_sheet_widget.dart';
import '../../newslist_details_screen/widgets/news_card.dart';
import 'cubit/home_state.dart';
import 'cubit/home_view_model.dart';

class SearchWidgetResult extends StatefulWidget {
  final HomeViewModel homeViewModel;
  final String? searchText;

  const SearchWidgetResult({
    super.key,
    required this.homeViewModel,
    required this.searchText,
  });

  @override
  State<SearchWidgetResult> createState() => _SearchWidgetResultState();
}

class _SearchWidgetResultState extends State<SearchWidgetResult> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_onScroll);
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels <=
    //       _scrollController.position.maxScrollExtent - 200 ){
    //      widget.homeViewModel. searchForArticles(widget.searchText!);
    //   }
    // });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent -200) {
      print('ok');
      widget.homeViewModel.searchForArticles(widget.searchText!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      bloc: widget.homeViewModel,
      builder: (BuildContext context, HomeState state) {
        if (state is HomeSearchErrorState) {
          return Center(child: Text('${state.message}  ${widget.searchText} '));
        } else if (state is HomeSearchSuccessState) {
          return ListView.separated(

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModelSheetWidget(article: state.articles![index]);
                    },
                  );
                },
                child: NewsCard(articleModel: state.articles![index]),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: state.articles!.length,
            controller: _scrollController,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
