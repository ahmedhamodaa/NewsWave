// home_view.dart
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/drawer_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'General'),
    CategoryModel(categoryName: 'Business'),
    CategoryModel(categoryName: 'Entertainment'),
    CategoryModel(categoryName: 'Health'),
    CategoryModel(categoryName: 'Science'),
    CategoryModel(categoryName: 'Technology'),
    CategoryModel(categoryName: 'Sports'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerListView()),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('News'),
                const Text(
                  'Wave',
                  style: TextStyle(
                    color: Color(0xff2cb3fc),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            floating: true,
            pinned: true,
            snap: true,
            bottom: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs:
                  categories
                      .map((category) => Tab(text: category.categoryName))
                      .toList(),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children:
                  categories
                      .map(
                        (category) => NewsListViewBuilder(
                          category: category.categoryName,
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
