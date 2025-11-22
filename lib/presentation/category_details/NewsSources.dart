import 'package:flutter/material.dart';

import '../../core/di/di.dart';
import '../../domain/model/source/source.dart';

import '../newslist_details_screen/cubit/news_list_viewModel.dart';
import '../newslist_details_screen/news_list_view.dart';

class NewsSourcesWidget extends StatefulWidget {
  final List<Source> tabs;

  const NewsSourcesWidget(this.tabs, {super.key});

  @override
  State<NewsSourcesWidget> createState() => _NewsSourcesWidgetState();
}

class _NewsSourcesWidgetState extends State<NewsSourcesWidget> {
  int selectedIndex = 0;
  late NewsListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<NewsListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            labelStyle: TextStyle(fontSize: 18),
            tabs: widget.tabs.map((source) => Tab(text: source.name)).toList(),
          ),
          Expanded(
            child: NewsListView(
              sourceId: widget.tabs[selectedIndex].id,
              viewModel: viewModel,
            ),
          ),
        ],
      ),
    );
  }
}
