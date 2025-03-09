// views/search_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/search/cubit/search_cubit.dart';
import 'package:news_app/views/search/cubit/search_state.dart';
import 'package:news_app/widgets/news_list_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Reset search state when view is opened
    context.read<SearchCubit>().resetSearch();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _searchNews(String query) {
    if (query.trim().isEmpty) return;
    context.read<SearchCubit>().searchNews(query);
    _focusNode.unfocus(); // Hide keyboard after search
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode
            ? const Color(0xff242424) // Dark gray for dark mode
            : const Color(0xfff8f8f8); // Light gray for light mode
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        title: SearchBar(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          controller: _searchController,
          focusNode: _focusNode,
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          hintText: 'Search for news...',
          onSubmitted: _searchNews,
          trailing: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Color(0xff2cb3fc),
            icon: const Icon(Icons.search),
            onPressed: () => _searchNews(_searchController.text),
          ),
        ],
      ),
      body: Column(
        children: [
          // const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 60,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        FilledButton(
                          onPressed: () => _searchNews(_searchController.text),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SearchLoaded) {
                  if (state.articles.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.article_outlined,
                            size: 80,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No results found for "${state.query}"',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  return NewsListView(articles: state.articles);
                } else {
                  // Initial state
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 80,
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Search for news topics, keywords, or events',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
