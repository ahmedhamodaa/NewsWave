// views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/news/news_cubit.dart';
import 'package:news_app/news/news_state.dart';
import 'package:news_app/views/search/search_view.dart';
import 'package:news_app/widgets/drawer_list_view.dart';
import 'package:news_app/widgets/news_list_view.dart';

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
    // Load the initial category (General)
    context.read<NewsCubit>().getNewsByCategory('General');

    // Listen to tab changes
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging ||
        _tabController.index != _tabController.previousIndex) {
      final category = categories[_tabController.index].categoryName;
      context.read<NewsCubit>().getNewsByCategory(category);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: DrawerListView()),
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
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
              ),
            ],
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
                        (category) => BlocBuilder<NewsCubit, NewsState>(
                          builder: (context, state) {
                            if (state is NewsLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is NewsLoaded) {
                              return NewsListView(articles: state.articles);
                            } else if (state is NewsError) {
                              return Center(
                                child: Text(
                                  'Oops, there was an error: ${state.message}',
                                ),
                              );
                            } else {
                              // Initial state or any other state
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
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
